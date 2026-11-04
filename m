Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793828514;
	b=cnW7SxNzqJuaJeo2tThWbQq+dRl/8QxUhAwu1A8Xz6dF7cVgWtkCTWjBiuzi2XjT5Qyc
	 LJIEDRSziAIk17I78g9G0j3RabD5yAnXZulFxHN7RfAsQjxFkj4+Pb83qrwd0Y17cVJdA
	 uaPoqmRnltwYoSLO7MGpEem1fb8gn4uzwTtNuxnEYm5/a8Vwf+9fNUx25Xt8XCmssSVGo
	 Dta77AaPbQdvEUZZ0UHuzu6w4hCPfSxlTfkkELVmf0dz9EjE7JW++AuqM95kvvJVQkfoh
	 AGOUTxtnIHTGyKLuWU1IKGpL1zo6dKmYeajBYTLWqWg1UaOG2LPar15Rc9G26cS+ecw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793828514;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=FOli0Z3Ak2+KJAKMycjEMfpFW6EkX5EN2TvmkA1rx/M=;
	b=Ur1eMKFWD+VkVmBkr7HC3CYzaZhB/BDcgX/5J1vgMWoZfJCMOZb85nYS658pJccyr1Kf
	 Y+vCHoAKdYG+96PHCfFdqdRKWPXFIQm6N5XBu19+kfNnbkRB4VNHjrjXbJSymEIvkPnE3
	 Pec1MUy2wvVpBYDmGI+79Q1HcqZ7plSrhvm1w3PFSRXoSVHRlNulM7+eWFZpfPGhiIudw
	 zSmrv3yAwTgSq6gCSMFSg90k6LWqYiYoFO1wOWdf9LSnKRqW+X8nLJ57Oxsh9OE4INGqj
	 dCN2QcfzhV7ePOeRBXhbUOCybaltMU+png3NvPozPNZzEBuRpgVhjufM2JpayM7N8BA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wPpD7X7f;
	arc=none smtp.remote-ip=209.85.214.180
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C56D606E2EE
	for <linux-usb@vger.kernel.org>; Wed,  4 Nov 2026 21:41:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2C56D606E2EE
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wPpD7X7f
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2e9eb579c0eso7850725ad.3
        for <linux-usb@vger.kernel.org>; Wed, 04 Nov 2026 13:41:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793828513; x=1794433313; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FOli0Z3Ak2+KJAKMycjEMfpFW6EkX5EN2TvmkA1rx/M=;
        b=wPpD7X7fFp30806qnprP9MzhsMxPuyDzoK2lP3gIZkxeCS7/oOZtGRcb3nj2VR+JeG
         qkLkGdWAonNeCbdLMY9IwtUZMCrjSSkMI/lADGMmIKWkM/H6Mk5+5QYT6AO0IJAFSCVI
         2QfP9xcoVjaScK0mi4Jb4AbhX1MQG5Z9U1mjjrN5b+G8Zj2t+brFx7eL9xTQIDdLy48s
         3fzgGs1yUHxA9i1fLUjoDi8fOZxJcm5MX/qi6J0o3txv2bC5V0JWkwm9W4+oEgcRxmvO
         g7U45OuL1uR3qZKztLp57Acn/5rSjt98oVxVIJ6jMbuAXLb58eLqugeVGsG28gWPSTUy
         0Cqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793828513; x=1794433313;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FOli0Z3Ak2+KJAKMycjEMfpFW6EkX5EN2TvmkA1rx/M=;
        b=uI0NYIDRYE0gcM+zsBzF4CdXrgUbZdSxOOCfDQKoo4TR2vEP/7+24DaSkiytAO6Xp1
         dUibUzKWxtB+21q8HStBIL7sF4V9bU+Zg0WvhiwKOmkczvy5q8n0UiUOfT20ocbjYAW9
         hb6tFjlmo2khLI9hKXbGVOmViiDpxJM6jpRH5mo29RmivlvgpoKLzK4DnnnUTlIOSIDI
         AOWUTJlbwXQGByDfEMIf5jLWCjk7jwXu7KkJiGVgbOjxEv3nWz8Zx03iWO3fV1rQyJJg
         NFWR4wEnAhvsZAuKb0cy4D5auyp9JFrUPb1EzeT567Ae89SuCAYk541k/sPBwkP3trx8
         k/MQ==
X-Forwarded-Encrypted: i=1; AKwUvBzgj3BhefydfFXmOsHua+03VGOsh+Qb0CgaLkbjHyGG08Ogf/a4opPBKwvTP2XAnWhQJfLx9JThcG4=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Y8vXTbYRYP7F45N+7Eq4jxJO0VP75VoycTPvsDP7NKl1AkLTZ
	EUodJuPf13I1gflX7c7PnpVyr3PT3gxf1epoirqvcltfXYudxJ0UlERJj++8ZYTFPlzJeg==
X-Gm-Gg: AYBFou1pqdnr0ZFRP/qPB2rqNZGwvBnha+w0H1/pfAY4z6xoeBPCTbYaqWuHCqIZMbb
	GT0J1AymrtVVPU5Z/kaEigh/biTtyCiohDcFdNT4c4hhFRuhlyvPBLuc82qq44T69jewQ6S3kob
	fWLqo1sZaEBIEhEt4W0MPlgsWhecyNOvqEMzkYpE6DbO6LcoyE6SPg+N0olhBkBSK8A/FqhKYDZ
	qD9Q90cx2OQLVDQ4vbpphnbouk3estjFroZRZcaw9VMh192c4TPd3NFeLvK2ev4d0dqyTRWkNlB
	9R9+uwLJUixOpdt85UbktMBTsxCD7PwD16jY52uNw2cWi19yryOpBjDnGjd4JXXmFlloYZ1pyt2
	y6b2qBowRafxChByeINltB1nkOdJN9AZSf5U5YoTroXNZCZ89PmymbtBxWMF3g3nsoO+kMoYDSI
	yAiNGQ7fjDBxS46t3Hp9RT3/jpGPmVC1YN/S2kIH9KziHa6LUBiI506KY6ELKIoDuOi0K4ZgsIA
	rfbaKmeGqRQdarkloO7a+NJRfwfIvmNLWpjYIT1vz/KWOZoyG+pvjWgQGRr778ST8dpsDfzumt6
	ytXRR5JhVPuTk/qBJn1XzYtP3fgnBrrYWnsKo/cYIdx5CShsLjeLvpdznaI70d5tZV8VfZ7hwUF
	QtQE0SEQIORmYnHt0GWGjTD2ZQg==
X-Received: by 2002:a17:902:d510:b0:2dd:c053:82f6 with SMTP id d9443c01a7336-2eb3646e2eemr157755205ad.45.1793828513358;
        Wed, 04 Nov 2026 13:41:53 -0800 (PST)
Received: from evo ([183.171.191.8])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ed08fdc5b9sm11951625ad.18.2026.11.04.13.41.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 13:41:51 -0800 (PST)
From: Ambareesh Balaji <ambareeshbalaji@gmail.com>
To: Michal Pecio <michal.pecio@gmail.com>
Cc: Mathias Nyman <mathias.nyman@intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: xhci: Tear down host on Reset Endpoint and Set TR Dequeue timeout
Date: Wed,  4 Nov 2026 21:41:35 +0000
Message-ID: <20261104214135.396018-1-ambareeshbalaji@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261104105003.3ca4a3ac.michal.pecio@gmail.com>
References: <20261104012725.147741-1-ambareeshbalaji@gmail.com> <20261104101506.5ae19157.michal.pecio@gmail.com> <20261104093608.2642748-1-ambareeshbalaji@gmail.com> <20261104105003.3ca4a3ac.michal.pecio@gmail.com>
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

On Wed, 4 Nov 2026 10:50:03 +0100, Michal Pecio wrote:
> If this happens on real HW then it's a different thing. Having logs
> of this anomaly would surely help untangling what happens there.
>
> Were you seeing these issues before 7.3? That release made changes to
> the handling of URBs on disconnected devices, which caused some people
> problems even in absence of host controller bugs.

Makes sense, thanks for pointing that out. I'll send the logs and the
xHCI trace as soon as I capture one, and I will treat it as a separate
issue from this patch.

Yes, I saw these hangs before 7.3 as well, so I do not think it is a
7.3 regression. I have no logs from those earlier occurrences, so I
can only vouch for the symptom (the device drops off the bus and the
hang needs a reboot), not that it is the same code path.

Scarlett also likes to reset/disconnect with -71 and -110 errors fairly
often. The kernel generally re-enumerates it, but once in a while I do
see the disconnect get stuck.

Regards,
Ambareesh
