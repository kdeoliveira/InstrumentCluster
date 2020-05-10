# -*- mode: python -*-

block_cipher = None


a = Analysis(['/home/kevoliveira/app/Qt-app/HoggarClusterV1/src/main/python/hclusterv1/main.py'],
             pathex=['/home/kevoliveira/app/Qt-app/HoggarClusterV1/target/PyInstaller'],
             binaries=[],
             datas=[],
             hiddenimports=[],
             hookspath=['/home/kevoliveira/.local/lib/python3.6/site-packages/fbs/freeze/hooks'],
             runtime_hooks=['/home/kevoliveira/app/Qt-app/HoggarClusterV1/target/PyInstaller/fbs_pyinstaller_hook.py'],
             excludes=[],
             win_no_prefer_redirects=False,
             win_private_assemblies=False,
             cipher=block_cipher,
             noarchive=False)
pyz = PYZ(a.pure, a.zipped_data,
             cipher=block_cipher)
exe = EXE(pyz,
          a.scripts,
          [],
          exclude_binaries=True,
          name='HClusterV1',
          debug=False,
          bootloader_ignore_signals=False,
          strip=False,
          upx=False,
          console=True )
coll = COLLECT(exe,
               a.binaries,
               a.zipfiles,
               a.datas,
               strip=False,
               upx=False,
               name='HClusterV1')
