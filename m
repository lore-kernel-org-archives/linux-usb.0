Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B3CF3783AE
	for <linux-usb@vger.kernel.org>; Tue, 21 Jul 2026 11:59:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.24
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784635185; cv=none; b=Fl++sYTevhShCSg0rY7BFmh+HeuR8MooktSUYFVso91CP9kPT4HmB6nFuYoFw4MCO24EOrxlA0vgp9/dkVDp3zZpJpKPv7SBWLmtxz/Ac5m6AX3DB27UatHIgFLWeo30DgUi4+AvJHG/L9SLd+874PK67xNiit9M2IqGUGbvOjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784635185; c=relaxed/simple;
	bh=d6iVx5IavUkxy8UDURux1EOCHlWiuEn2BmT2qru6KkI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:In-Reply-To:
	 Content-Type:References; b=GGEJRu8MByP6x9XVikUCNCsNhO5fjsw6f1at9VBAAukpAGgSixZGCcVcj7IyWn4N6rF5rVjbxLklTimXMRVmHahKTv6jtrjrb4QzQKl9mdWR56TdOqBFNvbk2tZiaAiSf8JEnfjuWaHPXL1LxeMPVMU3NG7RhPAwlax7oqWi2as=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=Q5O6xHEX; arc=none smtp.client-ip=203.254.224.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="Q5O6xHEX"
Received: from epcas2p4.samsung.com (unknown [182.195.41.56])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20260721115940epoutp01d36f32de4b0aefd72d7523394bd36974~ETD3b_RWy0617106171epoutp01G
	for <linux-usb@vger.kernel.org>; Tue, 21 Jul 2026 11:59:40 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20260721115940epoutp01d36f32de4b0aefd72d7523394bd36974~ETD3b_RWy0617106171epoutp01G
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1784635180;
	bh=C96dhuNGYGKvKEqRPxWyYPWU0tAfVKllf9BSY/CwOu4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Q5O6xHEXAkZir0t7rWpMOx0PdITdgVrPYVGUOQNyupyNyVQYCjToxgdG3w3360luo
	 OBJNv7UME1qDyfItrzZwfhP5/f/m319xN8Kj5MRFTx0M6L7hWVwSbw4kf53D4KQU7N
	 HUK5cqsmsYmzNSrZORFNXF0FD2YiGDWeHnV5wTFE=
Received: from epsnrtp03.localdomain (unknown [182.195.42.155]) by
	epcas2p1.samsung.com (KnoxPortal) with ESMTPS id
	20260721115940epcas2p197bbdab137deeb84f0eed21d14ff6a52~ETD3O0lPM1353013530epcas2p1T;
	Tue, 21 Jul 2026 11:59:40 +0000 (GMT)
Received: from epcas2p2.samsung.com (unknown [182.195.38.208]) by
	epsnrtp03.localdomain (Postfix) with ESMTP id 4h4GCJ3Vpcz3hhT3; Tue, 21 Jul
	2026 11:59:40 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas2p3.samsung.com (KnoxPortal) with ESMTPA id
	20260721115939epcas2p314179c3c0d831abdbb118793b6f48f46~ETD2WxuBR2616526165epcas2p3r;
	Tue, 21 Jul 2026 11:59:39 +0000 (GMT)
Received: from ubuntu (unknown [12.81.221.204]) by epsmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20260721115939epsmtip1aa7da3f6932722f87c4a09d56b42da39~ETD2SzPoC1265812658epsmtip1i;
	Tue, 21 Jul 2026 11:59:39 +0000 (GMT)
Date: Tue, 21 Jul 2026 20:56:45 +0900
From: Daehwan Jung <dh10.jung@samsung.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: "open list:USB SUBSYSTEM" <linux-usb@vger.kernel.org>, open list
	<linux-kernel@vger.kernel.org>
Subject: Re: usb: gadget: u_serial: fix stale req->dep panic on
 disconnect/reconnect
Message-ID: <al9efeoIVhWEc6DG@ubuntu>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <2026072102-acetone-revenue-f4b2@gregkh>
X-CMS-MailID: 20260721115939epcas2p314179c3c0d831abdbb118793b6f48f46
X-Msg-Generator: CA
Content-Type: multipart/mixed;
	boundary="----2_goLOs2Eo.NJF7jaRRb75kR90Fcpo6snoS7cibQGcDoSKK1=_23c576_"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
cpgsPolicy: CPGSC10-234,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20260721013831epcas2p18cc80c836585f3b38f718881de13cf92
References: <CGME20260721013831epcas2p18cc80c836585f3b38f718881de13cf92@epcas2p1.samsung.com>
	<20260721013509.2327242-1-dh10.jung@samsung.com>
	<2026072102-acetone-revenue-f4b2@gregkh>

------2_goLOs2Eo.NJF7jaRRb75kR90Fcpo6snoS7cibQGcDoSKK1=_23c576_
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Tue, Jul 21, 2026 at 07:35:26AM +0200, Greg Kroah-Hartman wrote:
> On Tue, Jul 21, 2026 at 10:35:09AM +0900, Daehwan Jung wrote:
> > From: "dh10.jung" <dh10.jung@samsung.com>
> 
> We need a name, not an email alias.  Same for the changelog, your
> internal samsung review should have caught this?
> 
> thanks,
> 
> greg k-h
> 

I apologize for missing it. I'll correct and resend it.

Best Regards,
Daehwan Jung

------2_goLOs2Eo.NJF7jaRRb75kR90Fcpo6snoS7cibQGcDoSKK1=_23c576_
Content-Type: text/plain; charset="utf-8"


------2_goLOs2Eo.NJF7jaRRb75kR90Fcpo6snoS7cibQGcDoSKK1=_23c576_--
