Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792511541;
	b=J94571G8ziC+hY1lgbeajbT6RtWee6j4XM44z+yzNBDcLq6fr8SjfdDvvViT1zNzq8mw
	 LxunexJXOZA/AqJuY9PdTvY41tCx8hI+T4dz/9t22T7MXWvnOOfmzvBvNEkAfsRS2VFFi
	 4wgaXCQ/Wr2n0D/zlFzexC8v5LL/9CxiPS4qdN6Bf39cvzzn6gByPxQVS0k0Cg9IZVwf/
	 NTO+2Wg8juH058xG86wHoip2icK3YtoiH7SORk7YP+rej3TibfU4VN9Dc1j7dAUA0LPrO
	 M42kbTrwX7pZD0ZUlJEldz77OQcr8kiW5QIA84Cvbrh7lht2SN+UjvftfxwL1HLRIFw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792511541;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	bh=n2NrdT5zDS0kkhFDqsqeiTGBX18CerPgmLJitntpUHc=;
	b=nei8UB/H2ZbS+CAgWSSCfxhTZF0x5THXU+CbyTtjvU1PQRU7i7yv1glOlcFCr0tY2PZ8
	 SwbZRzbXsJHu/OZrAecX/AkEGQp49advkmckCnX2O3k5ZLIJa+OXd2JoaniKYwp7SAO8I
	 xlUM9Ht4OrXCIJWtOgeiOAYE2D9JrziUm3ue8sj9j+btGITo93pEDaH7shuqL0DOZmo/c
	 SPP7+uB7z1TrQNxmGEsr1WCpSjIuJv8WebAImuohSmqsQcMo5dmDc43yP+8hT7NFnjZqk
	 r9+5Az1WLiGrdIUJgOVkC7zYFSDe71kq0ZJjHj8zUdcTkdOZFy97PKOp7dpR0t6zMJg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=StASTQzJ;
	arc=none smtp.remote-ip=209.85.210.175
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55D8460A2639
	for <linux-usb@vger.kernel.org>; Tue, 20 Oct 2026 15:52:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 55D8460A2639
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=StASTQzJ
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-8a06df2304cso142219b3a.0
        for <linux-usb@vger.kernel.org>; Tue, 20 Oct 2026 08:52:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792511541; x=1793116341; darn=vger.kernel.org;
        h=content-type:mime-version:references:in-reply-to:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=n2NrdT5zDS0kkhFDqsqeiTGBX18CerPgmLJitntpUHc=;
        b=StASTQzJyZyqKvna+MguyiqN5KFN/a0/4ciSaYm06uXS6Hhmbirt3OdDP9tTlKGo2P
         IrgWPKe5sPL4i7ns2XEYQGPVS7DWRcuDKEEq5DJXvEsazdcvssEJy1mT2xzDeh+H5ygw
         zwV78dfUU2s/1Fahz0p7w/CJr8InHVnxf3S2zYVtlvpI2wt0lpMvqUk25ETNAhWTCDmf
         q05ukX7sldIno4UvYQ0ftxfGjzwZz7TY04S4t/t11gwq60LwhQaDIlcLCPakDnpw5bG2
         92rVNWcoeUV0gUMkQpy9OLlVynMxd7Co0hJBal/cyxorxAFbyGEdBJZ0KVWqlWVJEOG8
         2/Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792511541; x=1793116341;
        h=content-type:mime-version:references:in-reply-to:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=n2NrdT5zDS0kkhFDqsqeiTGBX18CerPgmLJitntpUHc=;
        b=flm1x36btcuC1a9Vz74Nh0FaaeYPDCBAUcEQCIGB/oXEFUizxt6h5VGM0foAcmrSzO
         CLvIGMoka+VxvVg+iKlkYWJv4HPlnbMsnsoJ56FRT6U/nj2FGkbCjx7X/ALWlx4dB97+
         DYbShI6fn5Rx8goTN3DNr+mD8PtLntQ/Kqehg8T4FRZT3NKQ51xQOzpuwiNYhp2ibINq
         N4fPdDrJz0071dev/qTxxi/NtKkMeQn57/oJF8ouoLDMzrfmHCBFvJpXmDj3wYlKTO6E
         6MRGjn8jWXBU/GuaL+V5MJ44tt9S16W2ZegGAmg8zE+ITSrZAaOlMR68b2PBXyd3zkUJ
         3gag==
X-Forwarded-Encrypted: i=1; AKwUvByf2ROKkxV17amAK5STvylAJ6DSv0PTpGFQpX4hjWikVvl6z28cMKirr/UiZNtSq/8praPg60OHk5c=@vger.kernel.org
X-Gm-Message-State: AFq9FYKCzdsigqNVCUmiv0w0YE7b0hScv1qf34FrWYn+xtAxZC+0THGZ
	eQBrHo7Ktjd0N/wirDkTZy+QnlSWJwjNoy+XBWn8Q1GKoS0Xy5yjis5Xsmhv0z8AKWI=
X-Gm-Gg: AYBFou18nVgP++bre+RB68zPMGaglmeCJzIRkkvALtYpMt7q9ZjBI6mm8pGbtoKIMhT
	oleCZBziOLzbdqqwsLf31Pr8oxWhXHE2Gr1jC8VRq+Mmu3lib8MVe7cmXD4UgEY4APXkRQp/EjI
	agPz7LJYkvyrzhY/YquSztsvgvd0LqVqH1nma99rm5l0c9jIweGQsT4E1N3OR+qfvIA7C0S+OwD
	Ysyro2gcQImxbQIchxf11GtUlfP7p7JRQvFgwtU1GpIBrab+Y5K0hrlRd0EHQuf3jurFKp07fJK
	hRBFLn3VgMoOERlyG+o+YvkwivZ/AAY5cZrjNEgnlNodDuXyPUU3FZ6klAMLvMgn6NP+plfVMpb
	6au34tMEe7zc5+bugFTAHqpgjl+url9ptHifwrq+pP58EvyUmKQgEgslkawViXDZIOl3lFwl+/d
	uvpY+RjatpJyXZ8li4azhYgGd4oIUZaVwoxPn/nV0Lxtx0kSG2itbHtQvuwUVMkqj/VfEGMNWMd
	PavNXtMaZAmjlkHN263Iggr6A==
X-Received: by 2002:a05:6a00:468a:b0:8a0:8832:7b51 with SMTP id d2e1a72fcca58-8a08832cfb8mr93447b3a.0.1792511540588;
        Tue, 20 Oct 2026 08:52:20 -0700 (PDT)
Received: from [192.168.31.234] ([183.193.19.60])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a06b4d1a7csm2106541b3a.45.2026.10.20.08.52.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 08:52:19 -0700 (PDT)
From: Anfernee Cao <anferneemelokc5@gmail.com>
To: "Neronin, Niklas" <niklas.neronin@linux.intel.com>, Mathias Nyman <mathias.nyman@intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] usb: xhci: fix EP0 context leak on virt device allocation failure
Date: Tue, 20 Oct 2026 23:52:13 +0800
Message-ID: <179251153301.11928.2472677014573396901@gmail.com>
In-Reply-To: <e952e037-5be8-49c0-b0fe-bcf1bda77bdc@linux.intel.com>
References: <20261017111114.1135-1-anferneemelokc5@gmail.com> <e952e037-5be8-49c0-b0fe-bcf1bda77bdc@linux.intel.com>
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

Hi Niklas,

Thanks for the pointer - yes, this is the same issue, so I'll drop my
patch. Thanks for catching it.

Best regards,
Anfernee
