Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A24E63AFAEF
	for <linux-usb@vger.kernel.org>; Mon,  7 Sep 2026 12:43:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788784996; cv=pass; b=StGhtQcwF8HmtgRyt9LuF/jH+Y81PGYnrMLd8erAGKRhtp4DoTiNI+/1yodlJNkOCG/VqnMuGbgHmwdQzg3Jpgrlvj7BxdrBZ8D4QJwHicO5W1c9jLdOJtTHLpSp3vrRWbCP8eIjKN+f3h0IQ9lhg7YI0iDuvUz3NN5RHdtcl1Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788784996; c=relaxed/simple;
	bh=Can0iYMR5kuk62MnTALr4300+1+jwI8wYZCa7SsZSYo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sf4FuMG6qYgaREzsNRYOE7Z4i51deeJ4lG/6ZsP2+E/WUBiag9sisHmsRUG9rTUjqAw/z1uUiy2GuXCuy+ZjmIRFwr5ukiLvosW9kK5MHbeTvGqguzi08MQ9qrHGSY5tifaN//phB9zcPqZXdpdk8tkU1tP0qegzQKwHYEvPRwk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=Zv7Vdye9; arc=pass smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="Zv7Vdye9"
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-3a2e9851ed7so33342881fa.0
        for <linux-usb@vger.kernel.org>; Mon, 07 Sep 2026 05:43:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788784985; cv=none;
        d=google.com; s=arc-20260327;
        b=FFUmN+z21U3GNXnNvDOBdcxLuvbykWYYT/98wojKXvHLVaJGZpeOsXIG8e12KNu4cJ
         eNQ+PARJMyPlEUqgJMwQ3pHP+WdPfZPJ2fxUugNr/NxoMx0ot3A4tTSr9jENhNNaQT/Y
         LjvJSGV2JKs2F2S0dGlegj3hcQzAWg/T/FlThTO+4jwR6DBRN6sig9OfxhPhjWj8173S
         z921ROB9ojBm4RKNkVXu2k8II9lOeGv2Ey2DA+qzmF6Qu+wNf1tOX8LyZx7csjefLij+
         HEUEE4/rPOfOyF2/NKMW1DNXD39iz+1MChWGkY/0U3siKWadErOsiPbIkwJXslWnXOl2
         Qnpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=WaQ6Vd6ZWWWtAHUNaiiEnVQBbZ0C1N29EjiBBtZDAlc=;
        fh=Z/fb7XjrvCFmKJUHhIY8x6d9CAWBEZRHR96IUZx+il8=;
        b=jvx2F+1aclAi1xppvUwZpR9yNxBg1b1sTcbEHMYsoVU/Ys1qBBeeyiuZH8Ye0Ujlds
         jfYGyFT+Rrf5YjxS8e259KJvpitVuQFRVF2yjX7kFXXOy/cVCw6uBJQjR0jfRtko58cy
         OKYeQjb8msylYkosvYe1xL8l/Do5Y5wbVRli/nNeyfEL1g+j6EBVh/94LkBmd/p6Ap/k
         NGre3/qRUDxK8PgL7d/wW/tDaVpM1DV68gsBtaW0PNe+by38DqAdEdmXPGSRRNGx5qmL
         1bPkGAUQsp0DunP7+uvJbUGECAR2w1VcDnC8RsUYQ3JW+4j31cYfbm0w3m0/SbVeQl9F
         LOiA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1788784985; x=1789389785; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WaQ6Vd6ZWWWtAHUNaiiEnVQBbZ0C1N29EjiBBtZDAlc=;
        b=Zv7Vdye9zVZc9/W1VoJlUqkhcZv8nSJ0d2eSncMwvYdUxymkxHWIAZCc0rIskfgnH9
         q3ry8ycZTEmRAd8YaaTmkyDpxM9+EDPAdgB4Qg51X0B1ZbEGVnfO3NUq43ALHXPbAqlK
         AteMUMD1H/BiRMf+EeRuBPQdadYYZ+xHHVvFluVl20vzij0q07ZQC412JaPSgNjdF2Y5
         jo0zLqSlWpamqVkA/tSKJ9CDD6GAIX/1vnlSzK/J030b6F4Ogfqu+sUo+7ph7tmTtWVE
         aejmDzFOnsM+3e0+s3lmzD6KQS4YOrRvoCjCR4aU/fDJiH6dohkM7DyDu5chzgrjWUb+
         BAYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788784985; x=1789389785;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WaQ6Vd6ZWWWtAHUNaiiEnVQBbZ0C1N29EjiBBtZDAlc=;
        b=Pbe6NM2YXJo3AuE82E0CzxRDHtGld3Ztk4tRnsIQYuu5udcgqkFOYvHfVOeTOi4jYG
         ma3nvFGHPX9dnXGhgc4CwfZex4ZcQTvRR5NShav4LczDlW9KDWNpARGOWvWeFEzAbMTh
         pdffnNFvRN2APvyH28x0mVVWbkPDmK4/1jYfoUkKcq2NEfGb831DNnQsTpKBlw9Vzbx0
         F1zjv7QnVmsNfYlEvg3s7QQl3Ds6ngEiwAwEsC0/d7d6awdlwlP/OyVp0wGHv48H+VXM
         4v8I0I3wCn3gtRqDriBJghZlbvkovJGIDi015P+Cr9SNnq0SyN31E55QFddtCqRfqroA
         IpIQ==
X-Forwarded-Encrypted: i=1; AKwUvBxzfROr4YKmV8Oq/Mpw1rD20yTXrlCvMBecLcbhGEgE7DczjpIZIKH9iC+xjp5mwntTtkqAkp9ujbM=@vger.kernel.org
X-Gm-Message-State: AFuF++mjp26RidDx33txird4NVigTEZUXuShVMQJ+E9lsKrhsmCKzxDt
	s/hs6D12AL9mjybZVjkleqY/vWZ56Z8kiaxLtrfYuHbPqgmkW1At2+776nI1+RrI/Kr6v98gTcG
	FkWzZE9/sgjBIlsOTaWTg17FC70NwJZMm3FgPm4B95w==
X-Gm-Gg: AYBFou2lbimiPWidTEWmQ68bnKWKZRgICGcJuqc/WgeNA74PfijWtYsvQDEECvkzBXF
	XMONhcqp+ATc3dFtfoFx7DqpZhleNPn9fgVTlt2quEfBUQVsvbiSHVKlpijHHql8bpMWiDzOTxd
	ZQidPPVg0CncF1UXRPSiulcmqGnH6vmX5k7V2+neTgN+tPLx7sRidSGQj+RjZIfvr8+CCWFul7M
	lecqSgaasXiVQ0RzzeIzEuv4ipgR+TrzxDoFFibQ3wUaZd95AyCCm1VSOl693tW6l2XaWHaTZiU
	aZrPlXllf6e5vd2a3bggofcbopLAcuKuAiJp0rpBC+ekkakXR+3CvD0Nju/7THt6QfiUn/89mqS
	kUA==
X-Received: by 2002:ac2:5684:0:b0:5b6:1a7d:1137 with SMTP id
 2adb3069b0e04-5b61a7d1680mr3037645e87.62.1788784985148; Mon, 07 Sep 2026
 05:43:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260904234124.2336922-1-jthies@google.com>
In-Reply-To: <20260904234124.2336922-1-jthies@google.com>
From: Marco Crivellari <marco.crivellari@suse.com>
Date: Mon, 7 Sep 2026 14:42:54 +0200
X-Gm-Features: AcwNN1V-NEQRj_E_4-skJ9DU-VZ6pO98zab5_MEp_Pq-MC5jsXJg_VgMrZvG-Y4
Message-ID: <CAAofZF6bRxj4Nx2HocQj51YAyTamcy7PSuA3sxwY9hagjxO-Qg@mail.gmail.com>
Subject: Re: [PATCH v2] usb: typec: ucsi: allow retries of ucsi_resume_work
To: Jameson Thies <jthies@google.com>
Cc: heikki.krogerus@linux.intel.com, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org, dmitry.baryshkov@oss.qualcomm.com, 
	bleung@chromium.org, gregkh@linuxfoundation.org, akuchynski@chromium.org, 
	abhishekpandit@chromium.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 5, 2026 at 1:41=E2=80=AFAM Jameson Thies <jthies@google.com> wr=
ote:
>
> On resume, the UCSI driver will re-enable notifications by sending
> SET_NOTIFICATION_ENABLE. The LPM/PPM may be busy during system
> resume causing SET_NOTIFICATION_ENABLE to fail and preventing the UCSI
> driver from receiving connection status changes.
>
> Change resume work to a delayed workqueue to allow retries on failed
> SET_NOTIFICATION_ENABLED commands. Additionally, cancel resume work
> on suspend to prevent pending resume commands from impacting suspend.
>
> Signed-off-by: Jameson Thies <jthies@google.com>
> ---
> Changes in v2:
>   - replaced system_long_wq with system_dfl_long_wq

Acked-by: Marco Crivellari <marco.crivellari@suse.com>

--=20

Marco Crivellari

SUSE Labs
