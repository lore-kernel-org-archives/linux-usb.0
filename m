Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792563644;
	b=p70KDywJdV0ruML8V2T8cPPl76uQ//nuYlIJv/GocWwWx3jBJCwDKJQTsMlP8r8XfWGN
	 a7vK8RjbnSzb9pQLApX+qhyuygY5xEQ3al7YZw5S/fmL7QF/C+WVjgjkfpH2Dem/j3JtE
	 8T5+x8FPK5UIuLVtkdtac3I70uFlkzDf4pzIDBpdtNL/nsDE5SIW4rzE4u7ZNfTWkAv2W
	 5bpb1Khwk4B988iemMZ5/gI0l0PeYg24t28V2azEFaO1eyZwrL5EXg2X2TBpmfFx+eIEw
	 AdB3FWLUK+HNeW+K71T6D28unVUl/FnBcPSwNX1WHB95/TLK2Wr0jpAiuJbLCz99ygg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792563644;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=grDIDaY1+sQW7ow94cMmWs0H6QTuDMtRAuNpJ3QVtJM=;
	b=czSFFViO4LvppJ89aZmH7Q+QKu/pxeLYrwNWulN2Bo8OS++IsskWDG1T6XNIavjBPzaB
	 Np9g1D8Jfu8iXnlLzJLp+BtoOyS0FWkC9wLfWACwC6FrVg9Gt3Y8jANTSYxDhL6gAv+91
	 x/jl8HEJwvcUqS4oM0TKdFApSlcWEle50z0l1L6grTc2K0ahHMmZytk2vtC9fVwQcPF20
	 jNwjtN3G9+Lo5HMzAHyxxti0vEG9tZO7m0Jdp4Yr0yD+R/j2wUoMXsH9QRQtW4NSooX7Q
	 63I/2wv7h80Otsj2arQO8ZFR2IK3Ufyo/QTw8xayAOQD14o5gQdWNazGzF22Ipa5/UQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=qtja05MP;
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88E7E606A319
	for <linux-usb@vger.kernel.org>; Wed, 21 Oct 2026 06:20:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 88E7E606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=qtja05MP
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-48dfaa3fa12so943230f8f.0
        for <linux-usb@vger.kernel.org>; Tue, 20 Oct 2026 23:20:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792563643; x=1793168443; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=grDIDaY1+sQW7ow94cMmWs0H6QTuDMtRAuNpJ3QVtJM=;
        b=qtja05MP78WgfaUL/BFeqXtWnuVIvnMuz7946Xqt/vrDbOod15KLW3/r78CiznhKiq
         27Ys6n1tcL643tPROG5J/0WbY5iAW9SoOi+Jbj8djkbl1/y2NE5/YWHWKu2VXEAiYiOA
         TdSFxa8QzadHDBeV5BbRXliFahizVW+FauxEJFz+6Y4SNyd4hW+nll2jHLoQgQ3ecnUH
         nn3XsDztsfTBpWpRAIOoWGStsjIFWanFvnnRJ/w9qQr69K2tmQ/fWWwcs358KkB1Ar4s
         jWBkv0xzszTlLUyaBBuV2A3U5XSEsQxwpnxiubkMt4q43N4gXxQ2ul2fuOs2pXNiYWxd
         +vOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792563643; x=1793168443;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=grDIDaY1+sQW7ow94cMmWs0H6QTuDMtRAuNpJ3QVtJM=;
        b=Q+V9YLVt8ysSU+pbbWfl2cMS5TNZOuinUTmLAIOY2+VlraiDWOPvE+/8qkixJlX/hN
         D9ZC2soFgpeEelvaPSIl68KWYwCydHTaK4nzyhg92dNLLa3NSfR/0I8pRN7NGaLUESJ0
         Ds6VxXliK3Wa3GcMNedvzKH2nHI7AwIMqihw3+Rg92QfPO1PL4CfAxBHyo87dZu8suoy
         FWBjtuQSERfFAJOuciL5vBhB3EvRbfxGzY8n7cwXal/xuOkMj0K610DyZSC1N9Iv0LqI
         6L7ymI72MXMyh+6VPm1OqsDCv1bmpW1+P3+8FF/k0ul93KGPdLWg6nTXNZk3yF9eXwur
         Ag7g==
X-Forwarded-Encrypted: i=1; AKwUvBw9atiyq/68HM7kioOK0Ox8xVhi79jl+vWMz9bcV/2cR0vDf+EiY0OK0sNXX94fdkcUXUQkTcaQQBc=@vger.kernel.org
X-Gm-Message-State: AFq9FYLN+vcq5KaiOlr8xx4+KLG3DIQL4l7b35rFZR5eZR74iZ19W2L4
	D7hkAMXFphO9BHd/mwXKsbgSQoci+8r5y8zJRcwZjAjq/tgYOXKnJT7U
X-Gm-Gg: AYBFou2laU1cInF6ldzK86kLRHf2NPnzLC52EQ+q39sFsnPYqT/oL0nZbjTCe2DBWim
	twRnaldEMBCq93eNXi1C9otlFxSZntf5qtU8fNBPkg4IaYmQtIou5lDHqrvP1jsSNjn0qA1nIXW
	ZWxUVxQwFyZDUOAVeM/8NtjlJjUSCEoVZ7kwdu9kZu2Dxx4djKlBsr5T8uJqg7lUeVITfwR+qir
	dSpG48uX6bbkM+oWuI0yz9Z/7sDZoI9jCKTPZMdBzyHzEHEoXP7nNgemb2I+bJfVqyD2csR6UDA
	/xoa/ymOcRPZqFJS2G+vM/7HkkTmiFuE6ih9k8C6V+v9tZz8VKNXaz+uXvxDqRFWjIF7+nL0QRN
	DOvCzjQmeGjWk0n38emWV/C4IZGTDWQimRE75UN0khtF+G5DeRL0RI5L+FjB1LvIh45nLD0rb/s
	hHFecOIyafgPUAxXmqIrlgThoj7QD+xxmYOE94FJpdVuLP+5o+QMbYzMaya8S78FiXRNMmyxUpP
	ymu9tlMc/sGHUnbA/4RpXL6MJ0MJ9UnazVILTk4ZLgUMm5p3tJy6QakZj1qp3rLtzMZ8gKcNVVg
	GKlT+yg=
X-Received: by 2002:a05:6000:642:b0:48c:5a7b:7573 with SMTP id ffacd0b85a97d-48e1e9f117bmr8336048f8f.29.1792563642643;
        Tue, 20 Oct 2026 23:20:42 -0700 (PDT)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e25828e3bsm3386953f8f.31.2026.10.20.23.20.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 23:20:42 -0700 (PDT)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Krystian Kaniewski <krystianmkaniewski@gmail.com>,
	Neill Kapron <nkapron@google.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Wayne Chang <waynec@nvidia.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	Felipe Balbi <balbi@kernel.org>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mehmet.fide@screeningeagle.com
Subject: Re: [PATCH v2 1/2] usb: gadget: u_serial: keep the port until its tty is released
Date: Wed, 21 Oct 2026 08:20:40 +0200
Message-ID: <20261021062040.3973175-1-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261019090904.3264978-1-mehmet.fide@gmail.com>
References: 
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

Hi Greg,

Please drop this patch. Krystian Kaniewski's "usb: gadget: u_serial:
pin ports while TTYs are installed" [1] fixes the same lifetime problem
and also covers the two holes Sashiko found here. I have tested it and
replied with a Tested-by.

Patch 2/2 does not depend on this one and applies with or without
Krystian's patch.

[1] https://lore.kernel.org/linux-usb/6941beb7-8cae-4cc5-ba07-e1c8a8753fe1@mail.kernel.org/

Thanks,
Mehmet
