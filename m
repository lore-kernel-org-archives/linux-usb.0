Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68829414435
	for <linux-usb@vger.kernel.org>; Thu, 10 Sep 2026 19:52:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.225.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789069971; cv=pass; b=G7H40pjMpDLpuQ0eU1l4UwAyJDiYdReO6teK4jsznbDOoCMb9WKegf5Id78YEVOsxfG7OoL9lLWZqwhG2J11aCpNeZRlaZCqVu4RYGdCKAIDWM4DeQ+ayoesIfhUL42qfZNzhizZqyD1+oBXWRHlBAAAul6sl8MEMh934KxOOzQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789069971; c=relaxed/simple;
	bh=5BYR2LAlRCG7N5sJ/J8MZfMB9gZi5CyLaZoJi76cKSw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=to8urZYmJsxIu/TSnlHqjaCflsN2KZkcAdCZpEgAKKSUDg7aLX+ZBsml7b1PU9uHHbE5BtmckfmPTNzRk+wnnEYyuUls6ALdSJN6RUhs5PMxSd3CG19FsEKdxcLdMkKPvk8d0Djjpa+O0F5nnAqUGCDDpHwkaiDxg7WOaqlLeiw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=PDrO6TR5; arc=pass smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="PDrO6TR5"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-484366874b0so63191f8f.2
        for <linux-usb@vger.kernel.org>; Thu, 10 Sep 2026 12:52:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789069967; cv=none;
        d=google.com; s=arc-20260327;
        b=RH/2tv9FXz2IBDky6VT03uo4ijHlIU6Ya9Ov2I5Awm5hxQFwq1e9YyzUqeAUEzT/1j
         /n76sP2S0Fsq9I5Ya8vX1FG2Ha9KcpDETIrv+wnVxDaQAzdf0idIKsG44MrhYwzF9aAi
         GIQ6/QDrWOxu1plF2NTGtgqNx2f51lbTuZFp8YpDQj4LqPRtEHGJz0syQg2LrjQgQZpI
         zSMfcnHxGTZkfMw6u+jCHjS51w960qTPi92wzErfdZDE+GPyY3LeTPTsbSs0TSn8haQE
         MH1/SqMwVRNvaRDv5euL1zPjxzP/1V6gPVegiDC9QZmUv+yuh00JP+UD+2siXLsIN7qL
         SsXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=5BYR2LAlRCG7N5sJ/J8MZfMB9gZi5CyLaZoJi76cKSw=;
        fh=4GmjCwy0Q97rC39+48JYTIrt0iLd0Ks+04ZxG8QeCCQ=;
        b=tDClLlQb9J3xszbUDruxcHEDsJ32qA4nW/aFx3o9a2y3h0Fh+7GRZQyKXNxcqdJZVQ
         79wdgM7HddoBqAqGSjuIrHdd7oASIomuOk/H6vWiUOvqwQ915a9hjSWl1reELTiaUw7g
         m0H55bBKZu1SfqEIjVUgbhuWkc2GF6CroX7OizN+6tXGzjmcV0ma6pltGrAShlrBumg8
         +CmGLl4No67xLYfEj4IzFNaQ9V5MFMOGRz0cjlTsfgvxusXUiCFdLoY887MgatnLqvsS
         oGAFohm5Fg6jvs4n0zJQPpOnR3byEC2I8RSzxfvf2ffrduwBCM/mWTE9ir5ImgWez1ji
         VA6g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789069967; x=1789674767; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5BYR2LAlRCG7N5sJ/J8MZfMB9gZi5CyLaZoJi76cKSw=;
        b=PDrO6TR5mHiQ6mkfx3NfMoUR+P1inFsrAZ095Ddog1bZa/C8T2HrTVJucMd1/wImuc
         VTYJ53FTrIo8pO0o792CjTEcUs8tbp8u1Nkkz/jK/MhRyO06432FWYfJ6FLew3FXjubO
         PlY4oU/WdLAF93SxgxAcYKhj1FRrtm9O74Go/MqEZ503bFBZjm0JEWaFBmrCz2tLle81
         zYQxlODiLL5k9wC8kwRIjWrcqyMbHd2Hweovjsji+1muXNvY3rvoOOR/d78cGdEIv+Ff
         Kmsdq3B9OWUgaBgc7aENU8I07kTfkdgkrotJkws/Mi3Hqzu89rTynCZE/26hSEPmocjV
         FngQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789069967; x=1789674767;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=5BYR2LAlRCG7N5sJ/J8MZfMB9gZi5CyLaZoJi76cKSw=;
        b=FiDOdGSb1qSXgYjsmfZx9HzWnL1Jc7J6guXkq4+WU44wcvhLC6QTAPN5W9/aGr1/tb
         dQArGijGjGofUTfHR/dbssPJbWaU6SRK6dnHdRDshMCO9T5Hohnxh3OGaC7OuhiEaVPF
         oSuxnbCFDRGOGdkCOeKYDSUPT3Xj3LJDqpwaDlaP7XjcGR/gEeNxxdfxUQiJuHwxt9JD
         3Yva/oxR9kQxhAzKI6qP9YZJ2OKoe+v89eNHUyCSx2FDoqwJxxKDnzQgq2yxOQI9r8wp
         hkH9EQf73XvMB3z56BJIKPLN8iKR3udGzx90PidlkoL69TOlL2NMtLC8VMKtVAddnyml
         Sddg==
X-Forwarded-Encrypted: i=1; AKwUvBxXS+wmLS8yPIukChU5FSxXnGURUF6ZNpxF+IqWJiUOOQED35WdJZosOG3ookxl40+wdrNULBTHm/Y=@vger.kernel.org
X-Gm-Message-State: AFuF++nX94aGwhgAlznV36PtJXGgC6PojnpZ1HL7XPV73l5CU51mBak4
	qSiBehIvbE7Qdr3cdhKYKe9G9LrcZb2nrxeOyb3pNBDM9dswbkJLuBR1nAYGHZn/HDD/RJ2UsPU
	XpixlumdGjTQEb1JeGT5gwQV56YeMz65xhUQR7d9p
X-Gm-Gg: AYBFou2K3yKmAx5AkAJIn3UEedssbLeffrZK/pDuKtoW2c1dtQvW5tf+pc0mXKWqo2g
	wJTNtdS+pAZPL0WXwiN/p4vmGfIGzd/xzuw0MWTay4jvzLaok6nrvRjfHnQ1VQJk70/i2JpA43g
	1VZq8F8cobt4fWMlXvNkFUFk6BfSwnz5wR94FZ1/pyQuTgcB1Stdan12khDOY+WEWbJiHLYSb9h
	FTHEKGdY/gCL+6EPPy1fwEyF00ILybx6MvzVgmS/yC/aA1fvCyVc2Pif1pYiLvN7ZPPdv/zhCjP
	ekI6o219z38lTpkEIr3DymbZVYzzv1MrtSSw6mNhyNKjWaCKoSJx6RZn/1N/B1pLkbW3OJ7w/Qk
	YHj7p/iejbQ==
X-Received: by 2002:a5d:4483:0:b0:482:dac8:cd0d with SMTP id
 ffacd0b85a97d-486eb33ec05mr931955f8f.21.1789069966721; Thu, 10 Sep 2026
 12:52:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260904234401.2339633-1-jthies@google.com> <2026091023-numeric-husband-1b03@gregkh>
In-Reply-To: <2026091023-numeric-husband-1b03@gregkh>
From: Jameson Thies <jthies@google.com>
Date: Thu, 10 Sep 2026 12:52:34 -0700
X-Gm-Features: AcwNN1W1WwceoXxfw7kV1OcYc7DN9h4A1Bt3IOdWqxeC9UAzLths1l0qeH57h3g
Message-ID: <CAMFSARfnRpkq21j7WZYqdthy4aC7VSPjQAKm1eHvbYxhM6pOnQ@mail.gmail.com>
Subject: Re: [PATCH v2] usb: typec: ucsi: displayport: Fix OOB altmode array index
To: Greg KH <gregkh@linuxfoundation.org>
Cc: heikki.krogerus@linux.intel.com, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org, bleung@chromium.org, akuchynski@chromium.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Greg.

> Does not apply against 7.3-rc2 :(

7.3-rc2 and usb-next include the v1 version of this patch which fixes
the OOB issue but doesn't incorporate Heikki's or Andrei's feedback.
I'll send a quick series to revert the existing change and followup
with the v2 version.

- Jameson
