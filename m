Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794018276;
	b=JSqrJQBs2u2I0V7g40LT8+j5hr4KnjrYBIzPxgGQOE9AmXJHV7On2/Z2DWIcBiDul1kp
	 DgqGTDvwqeoZoMaxkWAaLw8s01EZknCsnamy9HPN7MIOeyirGbhKVCZuZIjFTktUHm7AG
	 2kEvFNF3vfw0wiwgbJaHS9x8qaCE4nfmFX8AKVyYdJaskhT+ZEsMqwu29mkz4TMv9A++m
	 lE2zqXxdonDNtSfOBsuhgnGvKfiSdTdh4CnudmOa216/miaAp0+A6vYlInmVAA3RQnWYd
	 V8gwgstgZLcsHFSky0D8T03p8BZEwHtv7Clvyp6dlQzqWnjA5sQRpH+g1cSk+N2osiA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794018276;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=FjCSPoZqolZXJYhaNm2g2BrW4DtVoMmzcaGBJRA24k0=;
	b=VrJtncR25R8HM91g48uqj2KegQdWtLL/Be59yFyUMnj82B3vXsqfGeKTgz5OE5KyaCET
	 zvJ9wYtdzuoovk/7GDpih8Dl1s128M+y50oA6fq5QGqCmvCIKrLpz1arIy3AkhPUCxOfv
	 G5doNmZjiBK99qbpVVAn6GO/dGdNJWLhPtgTK7IssGE3YsKcmYU9qXZXAQ2FyXmqrMgJX
	 0aF061kdRc9ocX+0SUVaqn1FqMoOtalVAEkI22jfaN7kOZ4KrzgtjEy2PajUxKN5xLE52
	 IaE7gpaY3MgW95HE3L+MI4s7zNWGjYySoDswkJqAzV2XJCSRX89F+HfHLKpEdtn7NOQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eSjkiBJ1;
	arc=none smtp.remote-ip=209.85.214.179
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF01C606A32E
	for <linux-usb@vger.kernel.org>; Sat,  7 Nov 2026 02:24:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BF01C606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eSjkiBJ1
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2ed06b725fdso1427335ad.0
        for <linux-usb@vger.kernel.org>; Fri, 06 Nov 2026 18:24:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794018275; x=1794623075; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FjCSPoZqolZXJYhaNm2g2BrW4DtVoMmzcaGBJRA24k0=;
        b=eSjkiBJ1GJSKlCY0J9TMrGiEt40u4LKEkFWYy8YQhKzTyDszPR7DRTJLnAlIOPCTra
         to8GWXI+ly4FICwA5Mt3et4caNSemgEt3Y3IPvZSbfZkhyVeEj/Fq+ckX12WalKo/Ktm
         jregUMfSxCbFeJ+smdIvzzHHtQyxaAvzIYcGnfpRzEQXSV03NsiZxXFH9HqTwtEPH7nc
         AjKwqKQfFf4b/5CozJ1oo1bKy4gJKkrEJMdknYWzFEXCghJdGzcWQ+ec5LKMVQ8aXv1H
         aYIA9ULSn/WUDzVvettv6QITQRcEtVoJK2aXO1Wa4BYzRs5y2vCGtTtDhyUxaboYrlAv
         MUTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794018275; x=1794623075;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FjCSPoZqolZXJYhaNm2g2BrW4DtVoMmzcaGBJRA24k0=;
        b=ocxg3Onil57GJgOeLsuqZpXoURoAcZOn9mPgb6O0l8nBHjA3kYjbEmgWyIxgMTz+l/
         wINHRcrkoJTjSdXOGLr+em/sTGYSGK19uNecjUaTFV5R5hbqlcbLCf5wbLof3niHLQsS
         1JVA9XF0wxDyiQmGp2VFxZ1mPJIBUzXnwBmy8prBsknJ4YXyjpGI6Ux9k7dTnRdPbrF1
         fU/1WEoI+SnpRzMDXmZ8sjI3T4IkJ5jzpd3IvQObpwY2ucAzPqUqLmqAG/Y5y7bUmgwC
         kFVwQbGhN4xNzWCRo2jzjPrMGWvfDjHtrubG8J2WSiZWQNMdUd6HtJ5eH1DzOJW9qGBz
         5fSg==
X-Forwarded-Encrypted: i=1; AL+hErF1OlClN8fGEVLeJhkwplwBiBxDvYXnSsPGvgqJGdBtd/2Md3+y8yXGYmWDvS4F6jTPn/y02nmlgKw=@vger.kernel.org
X-Gm-Message-State: APuU4Z91Gv8DfL2Ksgwa0w6vKOjw/vkn/8y+P4HfUizpBC1aLbjlKhSO
	MYeN9QXPTuQlY0zkElqSRo+X8ljQMYpPA5U19FgtC/DbmMK5pW6kLHHL
X-Gm-Gg: AYBFou3ggObRULHJHCXAW72cNuBUryKf+Da5KMfRF9Y0YCC/mOiHgtfGYnboHD0JhxL
	JU8dzljWSgU091pw8Ix+W+RfYtV121q+y8DrBKTsRcw4Dukfrerdw7X+mIvmpb148cD8t56msXc
	b13fmhgwA+syJs0uRYf8CGpVYVZHdBaS2F9sDN7gEHpO+xhn56QgCYDCEh9/pOxgBZP/7lZ/PMb
	Zh5pEVrYDMhf1qy9Z7HN/l9Vfv8lRT6+28gFkMtSqTtdlJ9rpdbSs5/Jp0r1/BqiZsJEO615kKe
	VZzirRNGAdP88CE3NaABAKbfPs5g6f12Gch+e36fOaNZ7BctQqwiOMC2wOz3MoYjCp2aXQX09dk
	uURQ/LE70jiD2gWofxIQLl1Ff4MuBY4fXQOMDM+I/ZHCPukXSBeXLVOWoSe+Uc0SJ3dGmw2cLKz
	W7MeJtvrSwDV2Prj0kYN/LnI8IvQEEKFe1S+cJSq7QXMYX1I2WgEXO86QCjS7Mm5LPzWaWm/omS
	ld+crM8TDeNnKgDqOZRlfeaIC0KakHTgCxYFBrhagq9e2UpywvdP+Z4lKu3/DImCYRBkSqWwKy5
	TU4yNvoNtf/j4s6iqYcF638I6gouM+PTil1waO+bppypq0BMDDWYCkvKXEGvcZ3+
X-Received: by 2002:a17:902:ea0c:b0:2e9:5e06:3345 with SMTP id d9443c01a7336-2ed67a21cd6mr6074255ad.2.1794018274969;
        Fri, 06 Nov 2026 18:24:34 -0800 (PST)
Received: from fedora.lan (d173-183-236-7.abhsia.telus.net. [173.183.236.7])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ed47d4034asm10407085ad.41.2026.11.06.18.24.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 18:24:34 -0800 (PST)
From: Artem Novak <artem122novak@gmail.com>
To: thomas@touhey.fr
Cc: stern@rowland.harvard.edu,
	linux-usb@vger.kernel.org,
	stable@kernel.org,
	Artem Novak <artem122novak@gmail.com>
Subject: Re: [PATCH] usb: storage: add quirks for CASIO calculators
Date: Fri,  6 Nov 2026 20:24:31 -0600
Message-ID: <20261107022431.144308-1-artem122novak@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261105151348.19009-1-thomas@touhey.fr>
References: <20261105151348.19009-1-thomas@touhey.fr>
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Tested on a Casio fx-9750GIII running OS 3.71
(USB ID 07cf:6103).

With US_FL_IGNORE_RESIDUE enabled through the usb-storage
runtime quirks parameter, 8 KiB reads and a 1 MiB
write/readback test passed. The readback was verified
using SHA-256 and cmp after disconnecting and reconnecting
the calculator.

Tested-by: Artem Novak <artem122novak@gmail.com>
