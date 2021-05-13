from setuptools import find_packages, setup

setup(
    name="fastr",
    use_scm_version=False,
    include_package_data=True,
    packages=find_packages(exclude=["tests", "tests/*"]),
    description="fastr loader",
    classifiers=[
        "Development Status :: 3 - Alpha",
    ],
    zip_safe=False,
)
