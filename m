Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com [209.85.160.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E601C3921FB
	for <linux-usb@vger.kernel.org>; Sat, 17 Oct 2026 18:34:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792262055; cv=pass; b=slnfy5IpEmh4FhKKYQgUIt/87FuhM3VaWfx/uZa48GYBUYv3k43CMjDYy9t3xIVdaPumc6ZE8NeFWzLlz3DQpaDN0xSSFZPs64hohQzgO6SRboflf7MkLPvGKW+UNkClsFhMiO+PwfMmezr6513Ln9mkH1PTDnGc2CNxoYJgdPw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792262055; c=relaxed/simple;
	bh=RfACz42M7YVMPqxX/5rCfZkRfxfVNzTwHSI+nsm2cR8=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=rPoUXogpvTfHOS43UxaTivIgKXlw5i1usBZvRT5AsM2mF2E6rD5nUOmPDKMvw2KuMDfLllTCRX13vd8KfW+Zpd1x8EkH9oGVTusYlkA2rfyRKYc9HYRji4rFCqjqLLHkJ/3tRe06gmD1pC5KGmnhPQ5xTlBxxjzB1mGquYraZPA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kgNB+nlz; arc=pass smtp.client-ip=209.85.160.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kgNB+nlz"
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-47b47de8b4cso721248fac.3
        for <linux-usb@vger.kernel.org>; Sat, 17 Oct 2026 11:34:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792262053; cv=none;
        d=google.com; s=arc-20260327;
        b=lVOsw95hjuQpjKQdMu893nTUmh+HihJi8rcTAxm7p1rkiXuK9ccDRLhigHc7UDj2jh
         +7OiR5KCiPJMrwfGgf3jzemeBDdoihG0IF1bJhmR1TdRxmzFbnt9rw2CCHMJLl8RcdZo
         COR3SOJ6+X1s8mLTAAdxfCkvV7kFhXYHC/+Mg54R+HGazrK4FNTIMUoKAsuHmfLCosOk
         Y5cJ57UQ4D5kwviAsqF6Y4Pwl46ZO8OnCI0gCE/X/Vm/+QtHMwou2x4Qd1H9IAvayEgJ
         WkFVA+HymwF4t/ATNo9lvqRTXujKaSlsq5nVoXgCTJxL3omGxuxG6CNB8TsiHbKDERwf
         iB0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=YXRH+BKuOAtt+6gTnDi82cGH2Nxapk5fJWp8oqX/Qxc=;
        fh=1Qr2OI9qfsGe+6c62EuwjoCq1qAItAYtIl5+pyXHaPk=;
        b=Q2nn5pZY4mzNJraI7UlxA4ZEA46K8UhoCMonrJTHntVTtLUyRqjMFu/AuUYXS/7Rsx
         hgSPaT5ruaV4rHIshtH44rkxbUhtU/rfq2QfXtYuVHXy9+xNk83K8qeoBUuqehFSe3Bm
         GAGLLF5EpqALqbcWBoMTEEydMaSA7DJNFMircu8lcq+mlp8c5rxTPvny9qYjYY22Gf4V
         ycsgk2bj8+NZd/p7UtmdUe1fp0YHTyw+CD3kWt8WX8PjerqPgweXgnMwnUWY/50RGWXW
         8UW3g1urx8Mm4S/oTBzioeylP44bFFRJSLGu6jtpJ2XmUggxityJu3a8M4EANEzH0j9q
         c96g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792262053; x=1792866853; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YXRH+BKuOAtt+6gTnDi82cGH2Nxapk5fJWp8oqX/Qxc=;
        b=kgNB+nlzzBy3LBonAKO7ANb65Md1zu8SE9V3j71gC9DoewLL91jYq3Y9da723lBrvD
         mQQg3sMvl0LbpsEAFZe+GB/WArq/YrBDVH5G0eMxVYMUwBr4mkAEeMYaJJdQ4oKw5ZnO
         CXCB5WN+KosxKSvFZeo+cQBvPZ3LDICyH25Q26qjMPCXbYwlm4IGEiVCLJ/f+F6yuZPu
         G3dPdWOuXQamPJh3d2nPhxh6WnAyYrMGgVk0Kw2ufakQ54Fvb6tV3cY3Owx4oMQCP8Sq
         QuL6EsLsNQyrF8MNPZ5aMKdFWnq0RALd17Iiv6go/k5fn1lBXt7P+HfoLTb6D7Gl24rw
         ogXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792262053; x=1792866853;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=YXRH+BKuOAtt+6gTnDi82cGH2Nxapk5fJWp8oqX/Qxc=;
        b=2CMbDBsgecO7dK4eJ2ZHIBlpP8k+a09PaJoNK7ZvecXCczY7cI8oLo9DVVVosGLmD0
         dhSW5xlglgZXnErblGhFzUh7GMNsA0LwXYvHk0Gs2qP2P9RpOhGU45pMsovmkYxZBwH4
         tGZ1/ikgOvkRjmyoZ55rvbLbrvGcMuKcylfGqiKblS1hqCJ6ScFWEUTeDjN54SHJ+qSy
         6xNjNdWyHNmKFSi21W8PUg1pFLo56YoNsJHGlTweaAAqF5m+q7YmnSvCcFgGgsTOkhIs
         bKziGWKjBX3XjzNUttxY+pT+z4Ee20lq3YVOXSRhMWm3XurqGzjxBbrvu4Ylo7cfbKwM
         zaGQ==
X-Gm-Message-State: AFq9FYJKxbVWW6jAoowwj+CEAeF+xAYfdOfCaexoEPApDT+G1APc1u2V
	g7c2C9igAswcfx88Gs1id/HGMPDmzUiCpae+IjaEbtTEXlxbTTLL07o2qvs2tMHT5Y25QpXla+M
	E+l2+lTxYbujksY++tv5gu+FzWLjCsRlSk1NGY6M=
X-Gm-Gg: AYBFou1/sHrll+gfAvpIJumYvJgifUay9EKa4zBZn34thPfcCeFNYS9bN5XZZr7/9yr
	/fav6fGBGyx1W4UuvVtKv3k1fbzf3WKs1QaB+RxSmoCwRi/5R6vV2cJSm4Aus/M0BTSy0Zx8eKF
	H8TlGICWmvqu//U9FTzWmjoAGFNTwkfVlKd5Lrv8GaIRDkopDOgDa7Fyg8/1cJ/gjaf8vIyQz62
	MqZas5i4MmujxuWQ34d1owOfMAFoqTPsBd6652dOHH9S43Kg6b9y+tmXb+A7V8jqdPUO+ZXMV4D
	DMPVXmgDvtg98FCc42mr+6jlMn6XCwvKl7KVL7IuFKmsrFBLpbmi3ryMtQXCvvndPsVKayAuRZ/
	NC+zeRuBSv6U+Sw==
X-Received: by 2002:a05:6871:288:b0:48f:e107:3188 with SMTP id
 586e51a60fabf-4a7579fd1d0mr3411422fac.40.1792262052765; Sat, 17 Oct 2026
 11:34:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Herbert Guariente <guariente.herbert@gmail.com>
Date: Sat, 17 Oct 2026 15:34:01 -0300
X-Gm-Features: AclHuK9fPiO9g4S61KI75tIDk-yrCbizyBetgQ8TyL6_Hs_8Hm821OI5ei8Niw4
Message-ID: <CAK7Xih7O5gP=1fQXmeFhrNUmzxA=L+8+q=wbjNb_vwKVxQOBCw@mail.gmail.com>
Subject: GameSir G7 SE (3537:10a0) disconnects during enumeration on hot-plug,
 works when present at boot
To: linux-usb@vger.kernel.org
Cc: stern@rowland.harvard.edu
Content-Type: text/plain; charset="UTF-8"

Hi,

I'd like to report a USB enumeration problem with the GameSir G7 SE
wired Xbox controller and ask for advice on whether a quirk could
help. I have not written a patch; this is a report with the data
I collected.

Hardware / software
-------------------
- Controller: GameSir G7 SE Controller for Xbox, firmware bcdDevice 6.64
- Host: Dell Latitude 5440, Intel xHCI (0000:00:14.0), port 3-4
- Kernel: Ubuntu 26.04, 7.0.0-38-generic (usbcore built in,
  Secure Boot + lockdown enabled)

Symptom
-------
The controller has three USB identities:

- 3537:10a0 is the initial XInput identity (interface ff/5d/01 plus a
  HID keyboard).
- 3537:1069 is the Xbox One GIP identity (ff/47/d0). xpad handles it,
  and this is what we want.
- 3537:1082 is a DirectInput HID fallback (gamepad plus a fake
  keyboard/mouse).

On hot-plug under Linux the device always ends up as 1082:

  usb 3-4: new full-speed USB device number 28 using xhci_hcd
  usb 3-4: New USB device found, idVendor=3537, idProduct=10a0, bcdDevice= 6.64
  usb 3-4: New USB device strings: Mfr=1, Product=2, SerialNumber=3
  usb 3-4: Product: GameSir-G7 SE Controller for Xbox
  usb 3-4: Manufacturer: Guangzhou Chicken Run Network Technology Co., Ltd.
  usb 3-4: SerialNumber: 000098C304D8C90D
  usb 3-4: can't set config #1, error -71
  usb 3-4: USB disconnect, device number 28

Herbert Guariente
