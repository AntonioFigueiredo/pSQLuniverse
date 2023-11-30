CREATE TABLE planet_types(
  planet_types_id SERIAL PRIMARY KEY,
  name VARCHAR(50) NOT NULL UNIQUE,
  description TEXT NOT NULL
);

CREATE TABLE galaxy(
  galaxy_id SERIAL PRIMARY KEY,
  name VARCHAR(100) NOT NULL UNIQUE,
  description TEXT,
  distance_from_earth_in_ly NUMERIC NOT NULL,
  is_spherical BOOLEAN NOT NULL
);

CREATE TABLE star(
  star_id SERIAL PRIMARY KEY,
  name VARCHAR(100) NOT NULL UNIQUE,
  mass NUMERIC,
  number_of_known_planets INT NOT NULL,
  galaxy_id INTEGER REFERENCES galaxy(galaxy_id)
);

CREATE TABLE planet(
  planet_id SERIAL PRIMARY KEY,
  name VARCHAR(100) NOT NULL UNIQUE,
  description TEXT,
  number_of_known_moons INT NOT NULL,
  age_in_millions_of_years INT,
  has_life BOOLEAN,
  star_id INTEGER REFERENCES star(star_id),
  planet_types_id INTEGER REFERENCES planet_types(planet_types_id)
);

CREATE TABLE moon(
  moon_id SERIAL PRIMARY KEY,
  name VARCHAR(100) NOT NULL UNIQUE,
  description TEXT,
  has_life BOOLEAN NOT NULL,
  planet_id INTEGER REFERENCES planet(planet_id)
);

INSERT INTO planet_types (name, description) VALUES
  ('Terrestrial', 'Rocky planets with solid surfaces and atmospheres.'),
  ('Gas Giant', 'Planets primarily composed of gases, often with large atmospheres.'),
  ('Ice Giant', 'Planets with a significant amount of icy materials.'),
  ('Dwarf Planet', 'Small, spherical celestial bodies that orbit the sun.'),
  ('Exoplanet', 'Planets outside our solar system.'),
  ('Unknown', 'Not enough information available.');

INSERT INTO galaxy (name, description, distance_from_earth_in_ly, is_spherical) VALUES
  ('Milky Way', 'Our home galaxy.', 0, true),
  ('Andromeda', 'The nearest spiral galaxy to the Milky Way.', 2.5, true),
  ('Triangulum', 'A small galaxy that is a companion to Andromeda.', 3.5, true),
  ('Sombrero', 'A spiral galaxy with a bright nucleus resembling a sombrero hat.', 28, true),
  ('Whirlpool', 'A classic spiral galaxy undergoing a face-on collision with a smaller galaxy.', 31, true),
  ('Pinwheel', 'A face-on spiral galaxy located in the constellation Ursa Major.', 21, true);

INSERT INTO star (name, mass, number_of_known_planets, galaxy_id) VALUES
  ('Sun', 1, 8, 1),
  ('Alpha Centauri', 2.5, 3, 1),
  ('Betelgeuse', 12, 0, 1),
  ('Proxima Centauri', 0.12, 1, 2),
  ('Sirius', 2, 2, 2),
  ('Antares', 15, 1, 4),
  ('Vega', 2.1, 1, 1),
  ('Polaris', 5.4, 1, 1),
  ('Betelgeuse II', 20, 0, 1),
  ('Wolf 359', 0.09, 0, 2),
  ('Rigel', 21, 0, 1),
  ('Fomalhaut', 1.9, 1, 1);

INSERT INTO planet (name, description, number_of_known_moons, age_in_millions_of_years, has_life, star_id, planet_types_id) VALUES
  ('Earth', 'The only known planet with life.', 1, 4500, true, 1, 1),
  ('Mars', 'The red planet with a thin atmosphere.', 2, 4000, false, 1, 1),
  ('Jupiter', 'A gas giant with a strong magnetic field.', 79, 4600, false, 2, 2),
  ('Neptune', 'An ice giant with a vivid blue color.', 14, 4500, false, 3, 3),
  ('Pluto', 'A dwarf planet in the Kuiper Belt.', 5, 1000, false, 6, 4),
  ('Exoplanet HD 209458 b', 'An exoplanet with a comet-like tail.', 0, 1000, false, 5, 5),
  ('Mercury', 'The smallest planet in our solar system.', 0, 4500, false, 1, 1),
  ('Venus', 'A planet with a thick toxic atmosphere.', 0, 4500, false, 1, 1),
  ('Saturn', 'A gas giant with prominent rings.', 82, 4600, false, 3, 2),
  ('Uranus', 'An ice giant with a unique sideways rotation.', 27, 4500, false, 3, 3),
  ('Eris', 'A distant dwarf planet in the scattered disc.', 1, 4300, false, 6, 4),
  ('Kepler-186f', 'An Earth-sized exoplanet in the habitable zone of its star.', 0, 1000, false, 5, 5),
  ('Proxima b', 'An exoplanet in the habitable zone of Proxima Centauri.', 0, 1000, false, 4, 5),
  ('Gliese 581g', 'An exoplanet with conditions suitable for liquid water.', 0, 1000, false, 5, 5),
  ('HD 106906 b', 'A distant exoplanet with an exceptionally wide orbit.', 0, 1000, false, 1, 5),
  ('TRAPPIST-1e', 'An exoplanet in the TRAPPIST-1 system.', 0, 1000, false, 2, 5),
  ('K2-18b', 'An exoplanet with a potentially habitable atmosphere.', 0, 1000, false, 1, 5);

INSERT INTO moon (name, description, has_life, planet_id) VALUES
  ('Luna', 'Earth''s only natural satellite.', false, 1),
  ('Phobos', 'The larger and closer moon of Mars.', false, 2),
  ('Europa', 'An icy moon of Jupiter with a subsurface ocean.', false, 3),
  ('Triton', 'The largest moon of Neptune with geysers of nitrogen.', false, 4),
  ('Charon', 'Pluto''s largest moon and part of a binary system with Pluto.', false, 5),
  ('No Moon', 'This planet has no natural moon.', false, 6),
  ('Titan', 'Saturn''s largest moon with a thick atmosphere.', false, 7),
  ('Miranda', 'A small, icy moon of Uranus.', false, 8),
  ('Haumea Moon', 'The largest moon of the dwarf planet Haumea.', false, 9),
  ('Oberon', 'A large moon of Uranus with a dark surface.', false, 8),
  ('Ganymede', 'Jupiter''s largest moon and the largest moon in the solar system.', false, 3),
  ('Deimos', 'The smaller and outermost moon of Mars.', false, 2),
  ('Enceladus', 'A small, icy moon of Saturn with geysers of water vapor.', false, 10),
  ('Iapetus', 'A moon of Saturn with a two-toned appearance.', false, 10),
  ('Pluto Moon 1', 'One of Pluto''s smaller moons.', false, 11),
  ('Pluto Moon 2', 'Another of Pluto''s smaller moons.', false, 11),
  ('Pluto Moon 3', 'Yet another of Pluto''s smaller moons.', false, 11),
  ('Exoplanet Moon 1', 'A moon orbiting an exoplanet.', false, 12),
  ('Exoplanet Moon 2', 'Another moon orbiting an exoplanet.', false, 12),
  ('Proxima Centauri b Moon', 'A moon in orbit around Proxima Centauri b.', false, 13),
  ('Trappist-1e Moon 1', 'A moon around the exoplanet TRAPPIST-1e.', false, 14),
  ('Trappist-1e Moon 2', 'Another moon around TRAPPIST-1e.', false, 14),
  ('K2-18b Moon 1', 'A moon orbiting the exoplanet K2-18b.', false, 15),
  ('K2-18b Moon 2', 'Another moon around K2-18b.', false, 15),
  ('Unknown Exomoon', 'A moon orbiting an unknown exoplanet.', false, 16);
