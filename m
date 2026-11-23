Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795412860;
	b=Aso4n082YELuPa34H1qSn9f3G149UtcULShdYZ3gjJU/xYF8SBD02wW50QXXl7yemYwV
	 vLj6k+Aen2xvSKYheTx2+bFaeaXmpScb3pBwFaLf6QqE6H5HAr5O8V9r1apbW7K6SwVRC
	 +SSJXqEgzcYjMmO5l3Gx2MDht4YrPZhNpGM6sPSTm9X4RDWTFRAXeJ2VlOGHFu3YPzyRk
	 Sv54IGLYFMA7ooD5YL1eoHaaZ+7/b6v1xmpEf3ljZ4TEkPuwptK1burV/A5x1a6MwyYBG
	 zHo0DhtxKARi5B80BwNa9MNaEfxtz/6Zpt9gxHPD9kzY5R+NrmsoXiM4/3KRh0x+k7Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795412860;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=56SHyKVJ+WdouONdius50BHyMIEUQkAFgvaBb/cDx+g=;
	b=EzHWJMS8/tGt0eg+h6TtM+aI6/ekqW1FpRPYE/WqQBx/g8Y1503kpN1O0Dcs+wS87OiU
	 EJ1X03cMyU8rvgklSxuqJm9HAfT6gDMb+qQEfZbJplrcQHubJuN2hg936vNPAbPFSsC3G
	 DNVP/B5r70wNqpKJBkTS+trIV31y2clZUluvjvfX2mOcG5xdUs0nyAk2V3nQJeQn/4jq0
	 pIKJRox2BP02FSVqIds4XZpTrO7bHakmGKEek8ix3GarO2ITUlXY8inE72AMlv9yfieF9
	 6G+QF+NL9cZVj7Yajj47QqjDbdXmgr+6zUgWnrUHxK2R3W2VMsdSAlsxp9eyL5SLIQg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MCHY9AVq;
	arc=none smtp.remote-ip=74.125.82.174
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8763C606A339
	for <linux-usb@vger.kernel.org>; Mon, 23 Nov 2026 05:47:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8763C606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MCHY9AVq
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-38564b4b017so3121763eec.0
        for <linux-usb@vger.kernel.org>; Sun, 22 Nov 2026 21:47:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795412860; x=1796017660; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=56SHyKVJ+WdouONdius50BHyMIEUQkAFgvaBb/cDx+g=;
        b=MCHY9AVqZC9aQpZildhbGqizSnpPzK97DMOOMOEBeFLWsjgKy74cwDx/5kroapgyQA
         jJsBv8IduBowoCEFmO+Za/sJL3lCTr3n3X8tt+ZdCTtFyOCJhqqRrBBNSObhPR8u0U7W
         82RBH0oO7DbUtS2A+XVRayPi1J1/FlvE9VMLjsSu//Rgvv7G5mZiUKr021wXeM6DAoOw
         5Ymf5BJjLgTMgVHejTuG4ZdJs7YffWRsE6foTx/4K8xn2Kx6V6AnnM+VArv9wngmg3jo
         Rf+xmPm2zbCmG/UQ7Zk+x5LS/FZ12BKWuAphi6fBF2/njhznksYHkZcBXTasnwp+MkG4
         iDCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795412860; x=1796017660;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=56SHyKVJ+WdouONdius50BHyMIEUQkAFgvaBb/cDx+g=;
        b=QBTk6Q7iMD1TFUj1i6IDOln5+O32HaR61qthR/lDWL1D6LF4kkCEvLGpfFA//vOBNl
         Zk4F8FRuagzL7qkoZh/QIHhGmHuqWNWqQOlrs29nSqmL+sepTYIdrfCYn4Pfj6zQExZ2
         j5AGQ8xJpIfQCX0t7SlQ9HJx3C9LTDj3F5JHDoQOEXBsL+k9Fpk31bvK+1FV3yeAimA1
         cyGzvyEVTOAWZp/zL+7IUzlE/2R1w0bo1UK62lEFwOlmqf1LYYL/Fr3puTR2Om9nTCq2
         NJyk5ux43iURatts0pXEzUqQeV+qc22L1uI4LG2daNfJe/N+cGv8tIJ5aldGOMQAInfk
         meNg==
X-Forwarded-Encrypted: i=1; AL+hErGm6N7DHVY7p8ErULZ+79MDFbbWp1MSUWFEn33XIsHxN7SpAmBJFqTk4mItz0ogRhMmVsHLIF+C1jo=@vger.kernel.org
X-Gm-Message-State: APuU4Z+TRPZPf593jGLinu3aBo+Khkkh/g6698vLtsUpWpYTSlJVft3x
	nA/zlB0b1/MGAt8Nl2oIFB3r9C2ZMZMXcgNwyuotFHx5+ETM43N/GtL7I0iP
X-Gm-Gg: AZFdTZeGtHY6i6ScofSpgYl9cFmG7Ra3Y+YbwqZNIv/W4d34dxPf9/kO5PQYOcdeYRk
	2FbxoscHSUXVnfQ+2UaojYQ3lQpgv7F+/FwMUqD56iFL8lnkbpLTwLXR26U7sY1iQEuqRUSSXXT
	0swlaY0qRP8N9Wj00UBHwC5E9A/XAJLcvSk+MgWWxZ0/IMNY42Uc0Zw/wPg1zrDnmF+XbqDhfH7
	lBJLaDQyg50y2M+Hz0Gb/d6qV1CKtq0VVohLigQ6wWyOodYePq3NJtaQwuY+HT0oh0sVJzbJnWy
	L6OWzwYV2a+SQvbE063yxsdv353gf+L6FrrYj9+ox2TfjUN25kudwCXSgscQSU4ozdeJBnuNn0I
	5wUHKCg92TyarIeD4mflVvTUj/SemF9CjQRH9PDr8suo0SGbDPVxZwh1A1LiPGdE8Zogw8K91VW
	0tBaq4PthQxmWaOlJ2wf8fDyONZoJiD1V2gcoKa8KdNEJsW1iIp+XDVbxCpuzU7mOatwH/c8xBd
	ZHc1QU96nQE71zrZKSSMEfiU2xZVJU//tJntBwdPhCmzBPvilxl//mUmZWLKooW+RQT8yammtFp
	ibkLx+AHFxWT//FH2SIjb+7wu1UGKcTLn4said579h62snxr1XRhGieDWLEsvkWIV4OzrhwEKfi
	EjNRnl/l2
X-Received: by 2002:a05:7300:d112:b0:385:7045:1736 with SMTP id 5a478bee46e88-38570451c98mr10412904eec.19.1795412859588;
        Sun, 22 Nov 2026 21:47:39 -0800 (PST)
Received: from at-Standard-PC-Q35-ICH9-2009.tailbdca44.ts.net ([27.60.27.67])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385f68bc0adsm28544419eec.13.2026.11.22.21.47.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 21:47:39 -0800 (PST)
From: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>
To: gregkh@linuxfoundation.org
Cc: atharvatiwarilinuxdev@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	mathias.nyman@intel.com
Subject: Re: [PATCH v3] usb: xhci-pci: Add Power handling for Card readers on Apple systems
Date: Mon, 23 Nov 2026 00:47:33 -0500
Message-ID: <20261123054733.11175-1-atharvatiwarilinuxdev@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <2026112342-engorge-polymer-0717@gregkh>
References: <2026112342-engorge-polymer-0717@gregkh>
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

> That feels very wrong for all non-x86 systems to be forced to include.

I understand that it may feels wrong, but the file checks for CONFIG_X86 and if it is not true, then it sets
x86_apple_machine to false automatically

#ifndef PLATFORM_DATA_X86_APPLE_H
#define PLATFORM_DATA_X86_APPLE_H

#ifdef CONFIG_X86
/**
 * x86_apple_machine - whether the machine is an x86 Apple Macintosh
 */
extern bool x86_apple_machine;
#else
#define x86_apple_machine false
#endif

#endif

^ complete file

> and this still feels very platform specific, why must it be in generic
> xhci code?

Apple macs use the generic driver, and i figured it would be best to do this as a quirk in xhci-pci.c
If you have any other ideas, please provide them.

Thanks,

Atharva.
