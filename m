Received: from fout-a1-smtp.messagingengine.com (fout-a1-smtp.messagingengine.com [103.168.172.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEEC23E8326
	for <linux-usb@vger.kernel.org>; Fri, 26 Jun 2026 09:53:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.144
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782467622; cv=none; b=giCL3FNxvix7aZfcwTQBhR/ykplmmQQ3qPirGGldCpZw0MZT1KxsUp6iJin5Hwn90uoLemCLHACrlBFb4kJTM4BQTVlgqAiYY4svr7yPaos9gg8zKzMc01jZDd49GmKmQJnUhD0UTnMVcmhYICtCrX2zGfoms3igrxYRlBMIuSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782467622; c=relaxed/simple;
	bh=h5T9voxmG3U3aKxRciuu7CfuXigS1ehdUBLAUI5lac8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=paTAKUO9FlNIEHZyUyFJkCo/6wAjQSzben5ivjmL9eNKydZxtKFLxYezhpvmw53hJoqtIk5jXwcCXP1vLI5TVR6dOwwsgmbOrklBJkm9DaSrhVWj7X8ZzbXg7RrvfoV8Ogvxl27O8bc4GxuixEtH1eZ9B3wgU1c+sV7C8hbgbnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com; spf=pass smtp.mailfrom=kroah.com; dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b=gE9/Yfj1; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Y2WqxXFy; arc=none smtp.client-ip=103.168.172.144
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kroah.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b="gE9/Yfj1";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Y2WqxXFy"
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfout.phl.internal (Postfix) with ESMTP id D4951EC02C4;
	Fri, 26 Jun 2026 05:53:39 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-05.internal (MEProxy); Fri, 26 Jun 2026 05:53:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1782467619; x=1782554019; bh=amrdyb+iWc
	Ndpy5G6BVSDCnwcZ4JdvsveANpkWvKc04=; b=gE9/Yfj1F8jNHOWe9E3E9kFcAv
	sIPCsipuUu02JAYz65XHBYt8n8KUCMBwjp1c7TsEYcBqi0rOQsVhIFbS6w7VQW5h
	K7sb7WongqpZ50fv9GERk4YG+EYRfMm1wS14VXWYdsW/djU14F6x12l91pbmTKDF
	mxUhamq4CsmnBzXvn61GYPtB1SnvOIqAT5em6Qo4PWHD/j0dum4WexxRkm35LEy6
	q7s+OPCn+BppFg9Y5nPPdjtpvvBE5DvPqwPcwBwGJmcdygUQZFLyfBelfvRYCUcb
	qtH2Ez7ZccYctxkyvsXgP1TAvbQiEHGevALUvuP+L6Y9/EQ431Uq0Zec9Mmg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1782467619; x=1782554019; bh=amrdyb+iWcNdpy5G6BVSDCnwcZ4JdvsveAN
	pkWvKc04=; b=Y2WqxXFytP0sTqAZYq+p3CJc94BKbbaJz9oOvxvKi1r8WuDXJVs
	iR/l/SUXvjssL0OH7a8GAkKDGLi269vbV7WuJ24QKvz7jtKH0Up9jpatLqEwSvtf
	RRmp0v0tA/HbMFTXvT0jSaEbqES7QEZFwrvYiJWRU+h8Wk2vKqltsD/xNx3mFvbT
	Kt7U8phrrfO1nrX2T70Sg/3tKWz2kj7D6dckegczbJOuFj1sUL88nt0kWkD4ofam
	tHugWfq4CGRZpKlTWImIvSSwDvSxuCMMbWEgCbcM+6gRLzFo+I8yYzR60ao7iqEe
	+iGswF2c6XKevlXVIk3G4ScZhQ8ZN8O2hCQ==
X-ME-Sender: <xms:I0w-amfYJgiuBK77MrPfRPHvEeP_CnDGlTaQWgaw6L9-4VKPPSwiNw>
    <xme:I0w-aoa-XPJoFju5ogZomKzCBjP1ZFa7W5S704xWywXXpfK_xmGSXJfwT6mr8aU7X
    ESgogPiycl9tSwlhSSjwPR70-KNQn6uXM04xJikmo2Zt8lg3qU>
X-ME-Received: <xmr:I0w-ajFFrOX6UMLIhuf8xi6AfcmBv90ZhnDvE4nQUNGbgJYKgwM9XOZ_TbE>
X-ME-Proxy-Cause: dmFkZTE+UUYpq2+89yFtXK2qQpCr2xgBgILGBpaHnvbLZuZ+fq+DjVRN3uJILgqm6fTQbR
    BLWLdXyBVnd9tpUqDHhCceozlQ81QdNtS1ZS3lb+KwQwYEGFwkE41ll67L74EPPLpHwUiH
    hqiY+WvMp0olZRn3H+WM+9CJ+ZBUdjq8WcV/oko5/wM68qbNASRMBdtzKsCP9ejEwenD7b
    8iTKE/LSb/mIKWg+z+9B2LPg/SFaG5iaTQEHacS7Qlj7DBxoGlchoiwrIY23cVBmKFYSf+
    6KtspQbtqLBNy7+/FJvrWOQTlH8HtGyKQDrbxTAybNnsKYUeTfcIHLBrhDrQQLHvLMcCrB
    q0rbU0rEFYCgFLPwFSvzs6Lzo1N0HO730Wb+T1ykLoDA1CDkJlV4Yx6jJNM51lMmeBFTPl
    0kM5gMbIHWx6alLZPdernehtvEfFTX51tEQ+EuK+Wmxrq3kU2TXvLDHRdFR7U3cM6gSSQs
    K3IIdBtSx8qBqTG3xi12PIME98CRc7XxBUOtrJ1/IjbumEPI2Bz4kPtlUmlx8rgg2UtT0S
    MRJR3X/WDNZlJyjkZ/JVRBKFGAhoNgl0Y58S/fdIUj3bQEuxsOfayscyNDLnqJoYiRa/vW
    4+FLwxnqZQO7mT3ZgEGcISQS5Xho/8vIN8qL6Gpc72R2sjX3lf9PhbKgJzSQ
X-ME-Proxy: <xmx:I0w-aukBKDrTaixbrqtXV2ryxoVNRDPNcvqGed7tw7Yaxhtru1iOoQ>
    <xmx:I0w-audp2nxE5yt6yO840F_YG77DtaadNCouunvpkPvR68y5OZ1Ltg>
    <xmx:I0w-akF0_U3HqTWoTmJis5bFLzJO4o5SQNIFvSyl4jqvRxZd26Mn8Q>
    <xmx:I0w-asgAFEWS2oftjUogfVUjeqLVtKK3d69U-0lGAVtE2dtT_Zp6eA>
    <xmx:I0w-ajpWpblwN0dGZbk_UB93waSOfqK-IMazhJWq_l0rgqF0HxkbrXcK>
Feedback-ID: i787e41f1:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 26 Jun 2026 05:53:39 -0400 (EDT)
Date: Fri, 26 Jun 2026 10:52:27 +0100
From: Greg KH <greg@kroah.com>
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: linux-usb@vger.kernel.org, Yehezkel Bernat <YehezkelShB@gmail.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>
Subject: Re: USB4/Thunderbolt maintenance on vacation 29.6.2026 - 24.7.2026
Message-ID: <2026062619-rut-gravitate-ce4a@gregkh>
References: <20260626092104.GO3066@black.igk.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260626092104.GO3066@black.igk.intel.com>

On Fri, Jun 26, 2026 at 11:21:04AM +0200, Mika Westerberg wrote:
> Dear all,
> 
> After long and dark winter the summer is finally here, and it means only
> one thing - vacation :-) I will be out for next four weeks without access
> to email. If there are patches in the meantime I will pick them up when I'm
> back.
> 
> I wish everyone nice and relaxing summer!

Have a great break!
