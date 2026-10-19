Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792431808;
	b=CoODtggx1E/aPt3Sx6OkD2Pp+pRvztbJ5A/bF93oJZ5ixqsJt8/OTTzzSZX5/9jbF69D
	 qfdc/fLRZqWiV8GeXwupEmPmncj0AcV5U+Gj9hZJHUVH4yUi2NnwxgE4xSPJYAnFMEtBS
	 gNYq3bMSYhD5BppWBHCvF2/hHwKpCfjy0FRqxgEUFg+K2sDQ74RJtTgKG8eOskrZeAaTJ
	 PxwSFXZNp1iONAGZw18C08MRQnvxyyIY8vkURMv3+67Z/+6grR8SWLW074EaifNTHi9Pd
	 SUghyg2Ob7IeR2nNtVP9vNZik/+eiepNm/H7HqbzFcujuA03iMjeTzFP46ycR1CwFVg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792431808;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=wPNrP0TYEUKG7x6O4F6XyqZ7BQHOfMHuho4V1iIvRxU=;
	b=Fh95sWPX+akYCU0wmZoCeq12L8ILe1OtfCf+HClZkkEsfSzMWR5LYAIrjC1c5vTI36Q7
	 ltSYyqGilxY13o/pclamHzmyMRcHUGF4A4XbLvBX5/nZvHgq+q7TBsUsm9I9/PTYwPYMi
	 tBH0zfYvCXEVscZL6oZ1bC9AfIfd4VutQZACfCihX6nN09HWp7ZBB+VZwpvG1TYeikkzQ
	 GlsntPt5IfuMGKNeN4kuBpzLIxvhAVr8J8n2D5AZp19g9W/Tzn3ZXCyeBc+oaxYiWeMl7
	 7/diMmRusX+3gfc3dyKOTjy8v+2rrV7A6xfyb2W8I5uNNf284Q2Gn6DccHy0dOSjiug==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="dNQ/sBPS";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.44
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40498606A31B
	for <linux-usb@vger.kernel.org>; Mon, 19 Oct 2026 17:43:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 40498606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=dNQ/sBPS
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c2af2ae1258so26054866b.0
        for <linux-usb@vger.kernel.org>; Mon, 19 Oct 2026 10:43:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792431806; cv=none;
        d=google.com; s=arc-20260327;
        b=m/l84I3tlq8U/DrWQgCgPKK3Wy5vQpkRYxb3jEGRvt4fhKIAlL2JNx0y6P+UQeMT29
         WlOyVSISrXYYK4ZPSHXl2mxNhwbZZB0FY4Eip4e5RnUjnZ3sJxob+oUhP0AMUzbv99yU
         pQ2udriaGUhts5amilWfPMOttZmZOTK/2218H5PhstBVcgWiVKFkwMmJW9cS3SyFKVao
         khCQ1e+dzfmDsZbklIrIZW8v5RUZIo0SJFT2NUxwG3h8+rJCcwxgP2orK/bFZqNKN6JU
         xAltxUf2FGFGkTQqwOg0vFe1y951rO4yKGo2NldApdxHt5cfxcZBu5IC9dGElnhxTIcI
         2ecA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=wPNrP0TYEUKG7x6O4F6XyqZ7BQHOfMHuho4V1iIvRxU=;
        fh=fuBIkrlTdZCxBptRhbnekekF1KDKeDV+w9wD34NyiWw=;
        b=rZSlyUWHnhOz1OY5Nl8LYVSgpjQ7y+YX9MuAVCCmO5JyRX6XtpOcTGM+ueqo67Xpy4
         m3pH2IuMUxB1/+Dl7UM9GPi4Adxy8Fk/twXRTHOecpJb+2pLLEBcK8gBch4X8CuANy46
         7lHfNCO+pLP5SPuOnWlHfmSiRVY9J9xzlGPTqh8JClQ0rASAn5qRfv/WGTiFNpejkzL7
         /CqIFDTL3aGpl9fakcUKie0dRbAHbNLiihaTLlEn5pKPZmVTGG9LZBV+o/d1ODDZcyIb
         x2+u3LRdgrc+H8vujwuT/Jf68drXObR6UippZs6N1SjZ7+yjcJbYqAFRhsa68BrZJHi/
         ZMHg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792431806; x=1793036606; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wPNrP0TYEUKG7x6O4F6XyqZ7BQHOfMHuho4V1iIvRxU=;
        b=dNQ/sBPStkXMQpex70SuZ62Yrgfa6wMNDbx1wEiIfirPCtEe1UJyUjsuzLb2RA6O5S
         lWAHfxZ787sebGjmPhX5LCBgQHeO1vzkBhXTbR9dVpVs3NBAe//yafBX0EWhMhyUgICp
         18kvDDsOhnt/TErM4twzrIsVSKoYX2D83qFqBUsupOWhOILENksjByGt5rnOcsf4ihNt
         1LDRvQMhAK97pGwxYnQtirazPDbatrPhL6mIWRDOdRvqG476UPE6p1WjDakvQRrnguBu
         nltB/cYJsNmLnGrSloLMmxaFUR+iImI6+9wrZk9zXO4pN+VIf//RjemQvN44XztefeAa
         gP6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792431806; x=1793036606;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wPNrP0TYEUKG7x6O4F6XyqZ7BQHOfMHuho4V1iIvRxU=;
        b=TITK7AdX/s5x7QU5zhFw3Yv85+rMFw+t0UmgzRhZCsk7NtrXd15I+yLbS8vRkMYYWd
         85E3uNIVB7ZMNuFS8K54jkmsUz9xZ/3kBMhwXuaWr8dXmq+k4VWrnvnKn6mjyBi1hgoa
         o4w4/Tcqp+N/nSfeTTRaplC8/hpFIVqWvsA0c3ZH7yFf+EMqLbc2K6NoU191+CFiD8Mt
         l1/oNKpHaGR/t3Q9wDFVEPQd7Wc/Q+tLRQVg7hQFDWaffoDk1Q495K48Sw1WYYbHXgkS
         OjTJUNmizqFKtMd59a9yx0lzQMrVj/I6kMMz8c147y8cWeuawO0t+ocOFWCOyZBSjAXJ
         eqPA==
X-Forwarded-Encrypted: i=1; AKwUvBwqnoVb/FwVjltcRIhfbtxdwcdTMD3pWuTZHrrlTTckNL8HY5Lov0n5gXJbY55YopC1EvxQViZZuqw=@vger.kernel.org
X-Gm-Message-State: AFq9FYKxBirtiZAEszL/SuV/4OnhOV12kWr8+Un5Py/Nma3IHT011zPH
	lFSLP2DAz5sAmDXH1BM/8ekH2WiFWnwcezYzDG7w4wbXYEYv5OinPf8qILWoHMQAk1ccSoLsQLC
	Gkc2V074NbBX1EElBK3iC7mJND6rFbZw=
X-Gm-Gg: AYBFou2MOCLH2jOMs0Q180I/TO3HDVWEvUaJiFzZaxayPBN/vLIomlkMmWt57R9LMTw
	jgfyzuLgEC8KW1qewntzjWneBrOMR1cQOsTPVCb2W2AgQbax41yckekydoHCewBksV8rrTmPPCh
	PDPTNi5OcScaGkPBCTnkW8DVUK+T4OZZqv10aBJnVB6SUmRK14Q8Hrjl35a7rc8hgDQtA3kMqH8
	8cZdpt/hS04sFYtQa/xcpHTEk8yGVg4RgFOHZMD+fVm1LsH0WwUwEJ/ocZoA78rZI9xO3bSGdwp
	uvqp1TGgxm3QPAp2U5U69Cqm+qbQMdUSYGmphKYajY7w9DRm/L/UjUjHlHvCKA+aAyWFGLONsFX
	dtZgr4mkoWKY=
X-Received: by 2002:a17:907:9489:b0:c25:3ec4:9e43 with SMTP id
 a640c23a62f3a-c419699efdbmr677930366b.0.1792431806365; Mon, 19 Oct 2026
 10:43:26 -0700 (PDT)
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <CABL4uFnCWgWdPL5s85O49sDyNADf4Lk684nx60g9wox_qOOOww@mail.gmail.com>
 <CABL4uF=f6Y06KmZ+ux2ZrboiLxivFZMyB_dqc4rTiEtiLd3GLw@mail.gmail.com>
 <20260925052929.GW106095@black.igk.intel.com> <CABL4uFn1nTrdxomWgAWs_gtsM5r1owt+4KOk1F39rXTLF3UZkg@mail.gmail.com>
 <20261016055802.GV176164@black.igk.intel.com> <CABL4uFncJktAvO9yVpZOjm=uAjLa7291deE9x805i8Kc7tFUDw@mail.gmail.com>
 <20261019061121.GZ176164@black.igk.intel.com>
In-Reply-To: <20261019061121.GZ176164@black.igk.intel.com>
From: =?UTF-8?Q?Pawe=C5=82_Frelek?= <pawel.frelek@gmail.com>
Date: Mon, 19 Oct 2026 19:43:04 +0200
X-Gm-Features: AclHuK_iN144bomguRyPkFyoET1YGuIlfI0rU3RxX7IM4Q5_G-GMP3EhdF86ZrU
Message-ID: <CABL4uFkwcK-5fXWY_csebiW2G8i+49H0kfN5bsmA_wGTAeVBqQ@mail.gmail.com>
Subject: Re: [BUG] thunderbolt: NULL pointer dereference in tb_dp_dprx_work
 after device disconnect (7.2.6)
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: westeri@kernel.org, linux-usb@vger.kernel.org, andreas.noever@gmail.com, 
	YehezkelShB@gmail.com, Sanath S <Sanath.S@amd.com>, 
	Basavaraj Natikar <Basavaraj.Natikar@amd.com>, Mario Limonciello <mario.limonciello@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

pon., 19 pa=C5=BA 2026 o 08:11 Mika Westerberg
<mika.westerberg@linux.intel.com> napisa=C5=82(a):
>
> Hi,
Hi
> I suggest to take the just released v7.3 and see if the problem still
> persist.

Tested v7.3 (Arch config, localmodconfig). The recipe that hung 3 out
of 3 times on 7.2.9 (monitors off via DPMS, back on, reboot ~10 s
later) now passes 3 out of 3: no hang in nhi_pci_remove, nothing in
pstore. So it looks fixed by 7.3, thanks!

The amdgpu side still logs this on every monitor wake through the
dock, but that=E2=80=99s a separate thing for the AMD folks:

WARNING: drivers/gpu/drm/amd/amdgpu/../display/dc/link/hwss/link_hwss_dpia.=
c:52
at update_dpia_stream_allocation_table+0x120/0x130 [amdgpu]
amdgpu 0000:73:00.0: [drm] ERROR Sending link address failed with -5

Pawe=C5=82




--=20
Pawe=C5=82 Frelek   (=EF=BB=BF =CD=A1=C2=B0 =CD=9C=CA=96 =CD=A1=C2=B0)
pawel.frelek@gmail.com
