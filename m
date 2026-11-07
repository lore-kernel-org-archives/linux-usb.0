Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794011732;
	b=kHF5i/IO28/3xrRHdhPk/eB52Y19fpx5/5i3fLcpLS8p75HDLjQqnWDM1uyY7OIxKeUN
	 n3x78Ubu6iRxGJKYZUlZL9RMHqIm6v17pp42gSIkJY/zD14LprcKXHcWbsxssRRrHQcXS
	 T2qO5zfo9XNTXwlBh1QJT68G6CFZKL1vKl8pCnNfKdNPlu8lb4cwY2p5tsmabZ54IbTp5
	 PPV8d27IPoMuTSwy5jYvriz75JnDh6UOLK6AyB08aLFYNOV1WPqAEkXvnnQRBSi3GBqr+
	 qPivIpNzKSEeqF4Ga0USJQNkY/ZnJJ3Zx8ancUKTVpCknTOOSEObyCCghxqp75/Qq3A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794011732;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=kx6Qy17jNmFrrPmA3ib6BBgJVPCpfYNFi+oQKnBEyHc=;
	b=tzEruC1Wh/OTlOuQKvdcXvZied3U/ukuUErAEwpVNb6QcBIKdlL1KgNSqE+pXR4J9GNE
	 Jj1eQLSf2rS2IzlUfgAzSHmchoC3Ko9Mq1wDR6SCGVGUKqGIrPpBgVUFrBWAmznbdGYCe
	 qYQONTadkLHJJqTXb2gesce1/A4TAj9HcCq2/NZS6bn9+iaqMZ4eMFWlqyZAiMLWHr5XC
	 r9f07TwtYyI7UZ5wCotziq2C4IDqHWtYM6IsEBM9mVuhX1cLxHBbOZb78CgTKDZFhz45+
	 q8XtUsIRJWmf3l6hRk7NGaxX7q9hiEd1R1DXvLHAHD+gfqUEZBEWzT/w1hjiK7HueAg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=G+Uy2mdv;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=rrXvGKXG;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3806E606A33A
	for <linux-usb@vger.kernel.org>; Sat,  7 Nov 2026 00:35:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3806E606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=G+Uy2mdv;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=rrXvGKXG
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794011731;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kx6Qy17jNmFrrPmA3ib6BBgJVPCpfYNFi+oQKnBEyHc=;
	b=G+Uy2mdvzPcBhLWIvtjjfvx2mggLhDXABc45zvm/Cj43w94GWMxi0R4/dPvaDZZfB9nvbM
	UZmQJRNIdc+y5zC9wNj6jcm+u/DLROkiQglCVGxYiTSyYYpnw3GVdBayhdn25t8RBdlhBy
	iP6prr4ocz3zevGdGUYo6yQl2r6hF0A=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-655-SeVvicjbPxae_mm6cQ1WEg-1; Fri, 06 Nov 2026 19:35:30 -0500
X-MC-Unique: SeVvicjbPxae_mm6cQ1WEg-1
X-Mimecast-MFC-AGG-ID: SeVvicjbPxae_mm6cQ1WEg_1794011730
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-91ea053ef90so23074076d6.1
        for <linux-usb@vger.kernel.org>; Fri, 06 Nov 2026 16:35:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1794011730; x=1794616530; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kx6Qy17jNmFrrPmA3ib6BBgJVPCpfYNFi+oQKnBEyHc=;
        b=rrXvGKXG/49UCai+fCKNtn8xp6wUnLSUOH+IE7qZ+pvB42mZzk1iwN4OqbWH/Y7w+z
         DzY4HvHGE4YUtb7WbOZJB2H80nEMhYbPnN73iGPqRoNpfSJvzz48RExk0qYKXSMeDbsX
         yLfEyJSEyO93BWoqqpU+J2Qan2hyTUeTa0mJPdh8wgSn/fI+Fap29jde+1gIPyxPftaK
         l/CkRY+F6YPMRApKZj6Dhfow//GM1jf/S3jpltuHX+4E6xSrgIQel+EERIBVbmtXulVD
         LTPoV8Sq+ueheTFEkGWnIDCHTf14OrQY/dZzjaFC1DwhYN9KV/FBVOd+Ug/8L1PF+Pwe
         sp3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794011730; x=1794616530;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kx6Qy17jNmFrrPmA3ib6BBgJVPCpfYNFi+oQKnBEyHc=;
        b=rEutemp0sskhmzUmvMn3id4gcyBRbi1R9MmdD34R+qoif1aqrwz2VChn899qnDXWDg
         lOr8KZMthuQSwVP996bErJ555lRtzYCd2gcrHs1S1rjm4clvTDbznRCQxsYiqVJnihmt
         hqGOR0zGUgy21sQy0l5f9/A6JXbkAhGSpXovYwAeVKgcRYw+7btEgPxwl7Due93mYL9q
         HXNhfYUXm/jk+4Gb2VjLTblaNb4csQW50gnz/XFI3lPr6AwxzZy9zYWt3vJaFrEPq3Qy
         K+nxD/4F+wrB2Jh+wxMmzGOpmZ99VZoicjej8YKc/763LGQc0GdWy/w6tqL6teh9RMUW
         b3jg==
X-Gm-Message-State: APuU4Z9WMuH5Up5/TvxiN2WuekQBREEJ/qFe8TE/mg3MOWTNitdbVJsp
	67gPLO2hmMrJMEyXDZ99jiHC1bgYXKEAstf9OUFycCOELffkvO6j2nmAXd+6fK3v5tOnyVQZaXJ
	vchW1RcODIyQUQaDxxMXd2iVOn+T3Hn5NBnPCaQXhobYOLbRItdzkCNMSkYPN1A==
X-Gm-Gg: AYBFou3uCIDfm4CN2dgykNxHcUgObjo/sXtCYdkA+w6rUInPZLqTCW798sA0EtK2/OE
	bZ8HJypIhjKno6dIb9WgPZpaLqXJrkJHgKbOCf2yYYOFemGoaR2fOTS+j5iJ6AimXe5HXDOKy9i
	TXrSZ7vq9Gc+vpJSGcdYSjs7+KTz+fpgK4cMQ9XowwavtGeXtVzuEH2gX6HKu5tCp8rmUGtqWfO
	tvCod9KWmW1jMQspjR4dP29GQMthlpg8cVAKV6O1mrEubkVLEji+ZnaCNri2m8T+dqy9JG3I3Li
	AShdryBjcu96czt6pNUwOXqimqtZcincspXl70L4aSz+npehugZVPfKco52oN4flZ9Snu1/N37R
	jw9Eb8q/GhIbDfxtM5vQppv+rHm6Qmw4dgkhVIeUP8f3Ij9DwIWZKh2Sv/5Z1sMYAdwgq8iG5Ho
	6Y2k66+uwTcpSAbA5L
X-Received: by 2002:a05:6214:858a:20b0:91e:a545:691b with SMTP id 6a1803df08f44-91eb4fd0da5mr31808186d6.56.1794011729710;
        Fri, 06 Nov 2026 16:35:29 -0800 (PST)
X-Received: by 2002:a05:6214:858a:20b0:91e:a545:691b with SMTP id 6a1803df08f44-91eb4fd0da5mr31807906d6.56.1794011729128;
        Fri, 06 Nov 2026 16:35:29 -0800 (PST)
Received: from bmasney-x1.rmtuswv.csb ([69.43.42.202])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91ea6a2c5c3sm32967686d6.12.2026.11.06.16.35.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 16:35:27 -0800 (PST)
From: Brian Masney <bmasney@redhat.com>
Date: Fri, 06 Nov 2026 19:35:12 -0500
Subject: [PATCH 1/3] usb: phy: generic: convert to subsys_platform_driver()
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261106-usb-subsys-v1-1-3a86369c3f86@redhat.com>
References: <20261106-usb-subsys-v1-0-3a86369c3f86@redhat.com>
In-Reply-To: <20261106-usb-subsys-v1-0-3a86369c3f86@redhat.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.17-dev-d96cb
X-Developer-Signature: v=1; a=openpgp-sha256; l=1010; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=np8X2zRV/eA+1OsMIBwj13sqlob9MRButNYve81CUuQ=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLLeFbmt1Xx6eFVx/iSmxNagNcuX+jDxXd7ymadQefYyT
 +8NaqfiOkpZGMS4GGTFFFmW5BoVRKSusr13R5MFZg4rE8gQBi5OAZhIQCDDP9PqdavUY4VzPHdv
 VVLZmKJxImThhfcfj7N2abrJy9x6yMnIsKdYbOuM2jniu66qxNb9bf1dsd347kvuKZruWTNXNjM
 v4wUA
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

Reduce boilerplate code in this driver and convert it over to use
the macro subsys_platform_driver().

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/usb/phy/phy-generic.c | 12 +-----------
 1 file changed, 1 insertion(+), 11 deletions(-)

diff --git a/drivers/usb/phy/phy-generic.c b/drivers/usb/phy/phy-generic.c
index a41671eda2a1..68deb7e52b43 100644
--- a/drivers/usb/phy/phy-generic.c
+++ b/drivers/usb/phy/phy-generic.c
@@ -329,17 +329,7 @@ static struct platform_driver usb_phy_generic_driver = {
 	},
 };
 
-static int __init usb_phy_generic_init(void)
-{
-	return platform_driver_register(&usb_phy_generic_driver);
-}
-subsys_initcall(usb_phy_generic_init);
-
-static void __exit usb_phy_generic_exit(void)
-{
-	platform_driver_unregister(&usb_phy_generic_driver);
-}
-module_exit(usb_phy_generic_exit);
+subsys_platform_driver(usb_phy_generic_driver);
 
 MODULE_ALIAS("platform:usb_phy_generic");
 MODULE_AUTHOR("Texas Instruments Inc");

-- 
2.56.0

