Received: from fout-a7-smtp.messagingengine.com (fout-a7-smtp.messagingengine.com [103.168.172.150])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 230BB3806DD
	for <linux-usb@vger.kernel.org>; Tue,  1 Sep 2026 13:39:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.150
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788269976; cv=none; b=cUI/JLszt0mLnOowOT7HlTedY4Iu+IMoHah5y7UMoR/EQ8nJuOKyPdearMu/2AN+1iNbj6l66TBG3qJvPql6VNUgHSsusfM6NvcP1W85pSCLtI78AW9xTyim7XT/IOtcISN7K9UDkGEm1kCdInneTMC195cfrj5SmzNmMqOluug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788269976; c=relaxed/simple;
	bh=XODZE6cpGbiZ2rfCZnYVlR3lsaqnWgCCrcOR3bZCFYA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Om1tFkkxRIEYXWEqAES4vVSNa0DIf6gvQokalnMpTVrE1t5rXxxt1WgIsVYdgy4SPBN7JjzOw/3TRXC9GXZOSjdcmxS8j2fIgSB6SVifBVhWB7YO7rL8gAi4yTFg6rXFemh+BUK4xJcjEFvI8+sQWWJZAlqVIElNmYXm30nWqpg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com; spf=pass smtp.mailfrom=kroah.com; dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b=Sn6XtCuy; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=h0nbBf78; arc=none smtp.client-ip=103.168.172.150
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kroah.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b="Sn6XtCuy";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="h0nbBf78"
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfout.phl.internal (Postfix) with ESMTP id 1BA5EEC013A;
	Tue,  1 Sep 2026 09:39:33 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-05.internal (MEProxy); Tue, 01 Sep 2026 09:39:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm3; t=1788269973; x=1788356373; bh=XODZE6cpGb
	iZ2rfCZnYVlR3lsaqnWgCCrcOR3bZCFYA=; b=Sn6XtCuy3M6UGIzlG/XmXE0dyo
	VTRQ1ALwGB/U4AU+JeKQCH/IUwbKE761KZMiiEWh4ROzRUz2lVoMgErrnZ3MyHBC
	KlOgoEwcJtGYatCgJ0HqZlCN3F5eyklB2r3PJWV8UIEdJKmhGdFFQqXM8U9cMJzs
	ap3yaqOmSAQ4nPdSSq+OgpGEahFy2jlU/DJCa/SJfZOZ3GhJva121SC/UW1/CTRX
	00rNr4fOhFONS7wH1a/a7v+efQwF+v12xupvpkO2pKOAGrir2JG36nsXGe2IIiAw
	drk1V0AwSij5h+ZlEynlJWP+pDgsj2EAbuvqD6LwPlVZZwLMFpOomXxVWbXg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1788269973; x=1788356373; bh=XODZE6cpGbiZ2rfCZnYVlR3lsaqnWgCCrcO
	R3bZCFYA=; b=h0nbBf78tF74hUDg3n4pNGG+4sp5oRjVPPCbi6vLi8WC77Wx4hd
	ECZvjG4upETz/B1/mrbQv96qey4O7k8v6pGzY++ZlBSkzwpgojyVle3AkQtXjlXz
	MpqtfmTAdyVNG6UzIenMep3zSQwWHgbYwj3xIiQF/hbdq1EheHId2n5bPn3yskzn
	AVWsfRka4Zqpvihr+EXDOzcHQMDvHF/S1f+EvcMkP1TrcoPGZciBcy1k+k2OrABp
	jxtTzi+Y5k+Q//eFBnut71ydyFhhgzNbuo0u7nCVTQEXm2bnvJnijrtRF1mvFAoh
	YHjp/cMx3SKb5EX7SfTohjNrwhYkj1S4iNw==
X-ME-Sender: <xms:lNWWavXXF08Z3JaYrx6rizJxNdzddKmRS_cNYGoDAOEABD54CPxyQg>
    <xme:lNWWalYfKX7H-Od-FRodjXbE6FMV3Q3TXvmzRkrD8Hv-Sd_QfacZ2WwO2m884AIpE
    RAqu7F72SwaatLA8ZQmhdPzCAQ5vVd-fvVdFBexiiB0LgnfzA>
X-ME-Received: <xmr:lNWWal3RMs794Rwr_okDyvP7poxeTs0oeMBixl1T5Kvfmytzq8RdYRExvZ8aWJ545fDV0HJjLwpxOBeQd_L7pZ-ZkjMmE6Qj-h0_ccnVebQ>
X-ME-Proxy-Cause: dmFkZTEAdXA5sh3hsREZxMlQfMThKI51vdQ0wi1lkDAkAAC5PQuQQCUQmRizrJ8KlQqixZ
    PSDSGIvT96AvGIFAqV4P3LXRaRUypLToFdL4aTVAEm4bO9EEBCkLVyvGaFDvsrGDEaWRVB
    VL6pcbSQkhzmA5hXPAyp0SDATW+35yzG5j4JWZctiI+SVHkkiuhJfV6Eeu4GaBjAtKJZfE
    D+r87N1sMgyKo3cHTp5aRtce3SnJnT2b/hi871QA7vvjR8AKxb/3qQXblgG6C/1zzBOFsV
    FMs7gyeltGq3v2cFlQiUO8rBzqcyl+m0We+OUPUpBCRpOCvKWYM1LAUHRgmToXJvxerHOG
    NmrHiCAvlQzPDKCHCsjWhNYyFRbb3CXdJZxQQDpGqyrDc0fwlaUrXAXra26yOFoGaYamuG
    E/NcED3qwPjgRTZByKXJUf9KfV9rcNySX8RSf3kN1LI9weilNmPxRtOOGq3VAupd9++5hi
    JDbJN140masLCK5jROYVqfA8JNB9QybfSXtANqPG1sJREHtb2iajAs/kGSSSMA5e2ZuzuJ
    6JDc8zvlxYjDXROkxWyV57UCchmp5M4leQdZzRLVAs4jUAudq2/OmE5VLNATt0MkpiYPZo
    h3uHnmhWfSqhAtbXY/9I5srTr9N43zwVb9Fp9Kg3te7pYXOsmNUYnXRxkmow
X-ME-Proxy: <xmx:lNWWangAD2oFlHTsHC-mApL4G-AN7fZKlJhESAqOMXT72hTdOzm4wg>
    <xmx:lNWWapYWWqmqSyjVca6NRLYiHU0aS6lPRaQlUIRAsbuYU3QYc9AaCg>
    <xmx:lNWWanRIGw0G7ApoFNAIiApzcwIkMMVagBfjH5SDNn6ON_sRrrUx7A>
    <xmx:lNWWakSkuB3O1XQxNIiP5BCmAPJqyIcNiJaxpJZxe85me9P6xHh1Bg>
    <xmx:ldWWat2yFfmPAMNqvFYrudxx_CZm6aQtcBLcjNEKaX0MS4WFIyerSpMP>
Feedback-ID: i787e41f1:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 1 Sep 2026 09:39:32 -0400 (EDT)
Date: Tue, 1 Sep 2026 15:39:28 +0200
From: Greg KH <greg@kroah.com>
To: CO <co@bugs.sh>
Cc: linux-usb@vger.kernel.org
Subject: Re: [BUG] drivers/usb: out-of-bounds in xhci_queue_bulk_tx()
Message-ID: <2026090139-shortlist-junkie-9bee@gregkh>
References: <2026082900-mortified-freehand-7c59@gregkh>
 <010001a05cec684a-64e27a6c-d9bf-4b18-8fd7-19fd00c3f42e-000000@email.amazonses.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <010001a05cec684a-64e27a6c-d9bf-4b18-8fd7-19fd00c3f42e-000000@email.amazonses.com>

On Tue, Sep 01, 2026 at 12:23:12PM +0000, CO wrote:
> Is it acceptable to send bug reports (without a patch, such as this
> bug report) to the list like syzbot?

I can't tell anyone what to do, but if you have found a bug, it's
usually best to submit a patch to fix it, as you have a reproducer so
you can test it better than anyone, right?

> As you mentioned, we understand many of them will be ignored since
> reviewers would prioritize patches. But we'll work with community
> contributors who would like to work to write a patch for them. (which
> faster than just two of us)

These days you can feed a bug report into a local LLM and get out a
first-cut of a patch quite easily.

But sure, posting bug reports is fine, but again, patches are better :)

thanks,

greg k-h
