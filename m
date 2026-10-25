Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792950825;
	b=P/qWKIgFxjQWStNLIJAuulN//WNJuC8hKHxE7J9w0ZGQIow+Kc+rTXg0ZC/hv2wcsLA/
	 C8lb1LPaikmrjBqhLq+vv1BQ2JJuyuBw68P0FMwLYL8kwXQYh+IiVPy6EMdSeEtWS+mJb
	 iYoiTRKuqxMUokESV90nLGDw0vFMOwSa53jOQLbG2wCgNwFwwWLRtYbBA9Waqoe/eljrT
	 cjc1LykvOcBcVJO2T9Hv7x6YNzf/NHf0L9naI9xbIw2khQ9A6e4jJGBnbL9AoOvgOAUEv
	 yywxxHZubPqiqPknisotBl9Vo6l6jsPg3UplMW1LqHxwxvC77T5JPxYceWaUchGnQHA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792950825;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=4tM1CZCTOthqk2L3aFIIx1N9nzdB9ZhpMb1K+DWtkCw=;
	b=X5z9HJaX8bJJHokj8KbVwlfOig3KvZboZiGKx6Iqraywd87zPcIXPYmjg05e0b0F8Na9
	 ZsASCzb+qTTGojRu/PpIke7nRYMKbfCm0jmVtbVB/VStpbqgigUI+23xsQ4hBqIKWvujB
	 b1VknVDxb2LP8DnZhbclZa4uNpdKjfuGp6pz9CjPGV5sBGrtfyK9jkKaoIDEDrOnDvQ/A
	 mXvmIcjhNF9z4ywA7AsLC3VeXFB2Dtt/hC33KvfbvcYTKsWe4KSwQfUs9dwyqzRWjRXmr
	 uUGO7zRE+mlGoLuzmRydxRGvc61mw1e5SY1kR0akeDGLcz84UqdWv7msbAlWnIEtYUA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=NcCPNLU4;
	arc=none smtp.remote-ip=209.85.208.48
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFAC2606A31A
	for <linux-usb@vger.kernel.org>; Sun, 25 Oct 2026 17:53:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AFAC2606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=NcCPNLU4
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6af9a9451daso3500933a12.0
        for <linux-usb@vger.kernel.org>; Sun, 25 Oct 2026 10:53:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792950823; x=1793555623; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4tM1CZCTOthqk2L3aFIIx1N9nzdB9ZhpMb1K+DWtkCw=;
        b=NcCPNLU4JwPubLcIcPop1WRQliRyXAYvUzyFZ+8NFNClI2J5PJ5qRJv4Be2E14ILbw
         GGX/icWxpbYJHJ0xdrwFWrM4oSqvzKrpLdhpOp4YvETcMkgnz8eh0ErfLSThcFiRT2P0
         2gMdThM4+rTEq7p9Iw7RvmFq+4tP3ZgHpwgDxIKdgbumPcMJgo3BH5hqKC1nSy5OPMpe
         Fi2s/UBFjPkDWOLiD3cMf/hdMAFB0Ucer8yfkD+Ix8UrW4Jb8NJAew6/e2VSGQUlZV2b
         TcfPA/es2jDHc8LAhN6aQuH8ZZs1//a1XURCubVUppxChTQjE+WGgDHbTU7e9sq6HSp4
         zQGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792950823; x=1793555623;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4tM1CZCTOthqk2L3aFIIx1N9nzdB9ZhpMb1K+DWtkCw=;
        b=VvVYjagkjyEg5zk0TJi4SlT1alpsbBHGCJxAyz3oUfaQA23O2pgESA7kFgglNRYgk2
         blKOmrvsjwbMHRN7XQtj3UGsyWVWhVwh1iSFwYqjfwzvPMh+m0bfaUvNjBAgGch2zKgt
         A4OxEAGuvceTkwedpTAdQkhzaHRq/WGeuf2/RA72i8W4hiu6UFY2nU6P685KIOeC5BiV
         aJL8n52vxO7jJ8as/JaGJ2Ptp1brQRj0e6qkXbXiI9PBJWZJSk6TqDPZP/BDiitWrt5a
         R7eYSFirVvVk88BnxTkty77Me0ajZiKro5HphFCih1ZpGjZpsoAst7v04hNviNlAaqko
         0VSA==
X-Gm-Message-State: AFq9FYKy/kVeF1dsqwG2uh0z/HPPL9QW9fLZVhMNR2I4zxUm9Iqeea3i
	72csHAGw++GSnTX7IoZCACMqz4iLO32dnh9n30AYhUYpRN7vftiVRt0UoQhXZ0PMBo2KChuk
X-Gm-Gg: AYBFou3kwjFmj1q6P4eMKje6KWvpbtelxrwMn/+2EuTJlXfIKCuxhQZ6JgCLI3cLZcL
	lWE/ICD2MeIoDJ8Eup6B4raNQ5Va2gHuh5i1sfsZgu+rzgHmLAosA1vhYa/cn/Yuzb9SNrH7wRt
	mQ0dZLF2Gx1IOJsc6p4U/yECExpFEYcoOLKpFFRuTHjZegfLi+d0bMh8jqfxEqzpOcAChJNn442
	/dPV1hzhq+JFVJ06FyptiVyi5CxV4l7nz8oH1rrCz9jfj+Bz1SROTv+9HdJpVYtJJV3cgKzFdP0
	mlXrrjc15TzIYMBtGRxBrG68B7QmXzeKTnuxU/eJAdP+o1/jLm6AYmfHBNK/n89M09LlNzSY8Ud
	R+xxCHDNpchbak8P7FAOIbuYiFESblIWzzxvT6DWZYRM+QinjIOfHMVwUL4dCudesRG2kda8NDo
	jpJ18FgGuNkyulvJ2rdCWJMCv4VR/mC8Xt6u4OguGAqvEXtUHjsHJ88WfQ8M2v9tz1jx6Y5Mnlb
	mHbZP4aiGz5RJwg5whr12QdX1nAzWkMZnDj2NgEmShamMr/rrZtL0GPZY0sTtmHA1skRQ==
X-Received: by 2002:a05:6402:404:b0:6b1:b5b8:b696 with SMTP id 4fb4d7f45d1cf-6b442fe421amr4675109a12.23.1792950822748;
        Sun, 25 Oct 2026 10:53:42 -0700 (PDT)
Received: from beelink ([187.13.23.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b445971a9esm2645929a12.19.2026.10.25.10.53.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 10:53:41 -0700 (PDT)
From: Aldo Ariel Panzardo <qwe.aldo@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org
Subject: Re: [PATCH] usb: gadget: composite: pass the validated interface index
Date: Sun, 25 Oct 2026 14:53:29 -0300
Message-ID: <20261025175329.2377300-1-qwe.aldo@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <2026102501-wrongdoer-unpaved-db9c@gregkh>
References: <2026102501-wrongdoer-unpaved-db9c@gregkh>
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

On Sun, 25 Oct 2026 07:30:12 +0100, Greg Kroah-Hartman wrote:
> Hi, please don't top-post or send html email as the mailing list will
> reject that.

Sorry about that, I sent the previous message from the Gmail app
which defaults to HTML.  I will stick to git send-email from now on.

> Yes please review other gadget driver patches that are pending to help
> move yours up.  also note that nothing can really happen until after
> -rc1 is out.  Is there some rush for these patches that you are hitting
> in a real device right now that requires these to be fixed sooner?

No rush at all, these are from code audit, not hitting them on a
real device.  I will keep reviewing pending patches on the list
in the meantime -- just looking to help where I can.

Thanks,
Aldo
