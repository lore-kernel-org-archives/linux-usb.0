Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.168.172.158
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795785099;
	b=NqJjjXWXY4kRTEhZjYetWT7YlnTH2Hcac01iX4OfmMj61Q2O9IOhz4PCTSOPgCxHV7fM
	 pMT00QuW/F1NZozN6KcfTKsky6CPWkCPDMSSRm21PlJpgXpeWCSrgjfm4bnJowNYgytFl
	 2xqaY3FzTrMav4CI44zVvrIuKfGj/JN+zUN2+Ay+sKSVYRzQXX02+gyDVXQItgzQxJNBe
	 2UBlwAWikoE+O6ysnu/h2i0CQPwK6kahEtSyBpzM1206I1RhEkzi0X3Dw+A1tgnWBF3uW
	 SeVkrupM5aEk2Y+Yjw5vCcoGXiefn9cHC31PGbWASQewaeNcBHd4MOLggPfyMv0YbBA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795785099;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=NNAclsmgf5tPHshzkkZfVG7edTHsPlRVIdn9fjBzSAE=;
	b=gJrc11fw/p/gS8iVupHh8138EL5kmcBBT9ibYzJ1NsD7/vwFJ9m8+DyyO9f5jJWQbmLQ
	 Wn8xCy7RnTRs37zjqg3egCWf25tj9v6jLtIBVevf8iF3bC+dCy8xMiPbQzQuRSCglPUWg
	 mtO6HG4EZySGUr63dUiwWkNG+nZLS0iluRFdg0eoszsetlZLjKS1w896EWFq8BkMNO2w0
	 vJW0/dQzKSylgisD+y/ruA77LhnMIMW0NpNsvwK2d2kAt+Ab4HuquBqz9ZD+OtnDSDV/G
	 mrrHdScWsGx4PHF2hqnvSaaPhrcG0ABnld7tVaRRS02ri4uDBratFot+B0ISblK1z/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kroah.com;
	spf=pass smtp.mailfrom=kroah.com;
	dkim=pass header.d=kroah.com header.i=@kroah.com header.a=rsa-sha256 header.s=fm3 header.b=qlOb8FB+;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=I4phDjKU;
	arc=none smtp.remote-ip=103.168.172.158
Received: from fhigh-a7-smtp.messagingengine.com (fhigh-a7-smtp.messagingengine.com [103.168.172.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A7E1606A31C
	for <linux-usb@vger.kernel.org>; Fri, 27 Nov 2026 13:11:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5A7E1606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kroah.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kroah.com header.i=@kroah.com header.a=rsa-sha256 header.s=fm3 header.b=qlOb8FB+;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=I4phDjKU
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 85D05140024D
	for <linux-usb@vger.kernel.org>; Fri, 27 Nov 2026 08:11:38 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Fri, 27 Nov 2026 08:11:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm3; t=1795785098; x=1795871498; bh=NNAclsmgf5
	tPHshzkkZfVG7edTHsPlRVIdn9fjBzSAE=; b=qlOb8FB+id7FfXBME8bbKizwTi
	UZiQmiI3cZOVMkZyxmpNOD/rnVhSu2ajjH46mYkccE1VR8qZcOlnNpsm+PW27KCO
	YmgKjbWoopYzgGsNteBHwQbIJyn2KdNDiin1psUCpf9d2tZSGWUYKILVanymihNK
	Li7ivY+SYnboZvJoymZaUVGv/sFOdh8PhUXHDASPSWB9+gz48ctZjLdztsR1uqJ5
	HK838Jwv3t9P7SgRRlWZyvyW3ykqppefgR2LTVdAs1/uiKuRgi95iCrNgqp2qFiB
	aykaIuWPpoI+FRVVXgW+hPEKfLq2vsytZQbsvMnUnhbFsh78BQFgklP1CquQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1795785098; x=1795871498; bh=NNAclsmgf5tPHshzkkZfVG7edTHsPlRVIdn
	9fjBzSAE=; b=I4phDjKU8TPJAqNaCKnjfoXiHZwhz8pIK7eK3tYF3gwILMjjS1g
	6e7f0doGTgeLll+++uRwGOSTub/b9YI/nD+0S4Bj1JgK6me83ebG23SkzNf+p96T
	VEka1vHYxLzg1W2qYuQbyXOeHq6llYjM/To7NMewjAYRYQOQ22RWgJg5PavTGdn2
	RuYEl0yHTh6HH3cwTUpkZRvSVRJzHzKAvCGWCPd5Wrzio/dRvP8dG18Yo1hPShqm
	aLmepOauwZ5wAvyVTc7UmANfH6NDvkW3PlK8PrdaKKEJh6SlxN+A9yU0I72QN/Ns
	UBw+CBxTk0hL5eO143r+GCBP8UBdKdOVvLg==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=kroah.com a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1795785098; d=kroah.com;
	mf=PGdyZWdAa3JvYWguY29tPg==;
	rt=PGxpbnV4LXVzYkB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm3:rsa-sha256:u01xPATf/wjgItjpkQkpmsKRa7rjeNOYVVt3j77s16D9h0R
	9dh46Pj0Y0otCCddGmFPVHmhxK7hUKyup2vytrgC1uZ6x35lOz6DEdDQEIsufyf/
	0dq6X1uf2+47o6ep5f40Bd9ygtbzSJBqGIeIqJlyecLfO8JoDiZlP1Ec89UEAsPY
	mYQwA13YgwdLbfpx+trvsspFX5DF9OJM/l5f6+1dAIetV77LrXG47lFmQqNZl9hU
	wBZYNf/ZXzVKhONaeV6+dXNRQWzNa9OPLJC3ola6kbibc2NHzbpMMotruCu8YYaz
	M6gsnU4Rx6fheTw7W5O1/3SGdAhomDGe9whaZkQ==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-disposition,content-type,date,feedback-id,from,
	in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:y/+CIhEeee7R53SuGs4olhgpkOCzYopnq52svLtwc7g=:ekXDS5YrU4bIbse581MI7K3gsI1oZ2eVdWbYKYEcXyU=;
X-ME-Sender: <xms:iIEJa5xZOYttKR8mXzu7KEBMakQkLSQK0CgsiSfAEqA3lbYbbMcCvQ>
    <xme:iIEJa1rPnfJzefFtaEk41PgaU7vBwDqKbxR8Cy_UGOIHRmr0nXKtb6M157NpGQMEu
    Ebkqv-rjLfZlhIy-lWgu-4qUh2SnW1FAUMUPUF72xVJ6NlYmLAN>
X-ME-Received: <xmr:iIEJa3y2L4vhq5MVDMnqYP77ZG2yaIXNChqUGvWkfn6_ZJVkAVqjlDFZDiU2WyG6nd577A_phLUAugksjv-dCvaqlCcp1g8>
X-ME-Proxy-Cause: dmFkZTFYzt3C6s73KmIik38zshN98iA7a9r/9C1pcWb+sCot+3ofXywXMFi/HEAjQKdAi5
    yN9Nkc+ZdbIfmxoJMp7qQye4gz2wnPXo79pJDvXZrFhiKww5wxqdVSaB8AG76QQ8uThSOY
    to6OPp4nGv/jQV+TUCXOs8NigXIaGhkkK1tRJz9bqp7kFGJ8Flm3dacJcgTYcXnc0TQBqW
    WNlBctxCfIis8BNmgJS1d6twX7qAPHwvr1tcDA+B2ezH2mAmNtQA5epc3EBoA6GhjikIh3
    wzr5hIAOxZ3FFC3IxfXs5rL/mCAP1S9fQFRHlBiv5S+uKXfZR9MKRg2ljJThF2cjP3gRSm
    9RRRq0bYxXiK2a6MbPAPbibAeMgKGOyIFD/LpD5CAM1uCmM+M7NEvJZZo2v9mPN3/lY+pK
    VhioNjH3r7F2XXomvEArE1zhP6Ue5plI9S+4C+KPCFs/qFHtopM3gHMw5/+e+DwnKmqgI5
    Bep0LEu0xBSQybFWATGRYqFlwBwu0OKGeNB5kdegMANeCPSiKME4momEjoBhkdKnOrCNKm
    i6O0yZa4SqV6zxR8B8BBMbklod2n6i34vINUl/1YxOoktj3q7unTX4yiRJ44an8LH7Wh14
    qa+6WJ2ALiD+/QKQY3gf/I5JKvubPxBCBRyZ9MU/i+F7MnQITAnWSzyr2zBA
X-ME-Proxy: <xmx:iIEJa5ovyWoe_4_1eULUWP01cCudhSK_lOSDUxg1VxHjxcmVhG6WWw>
    <xmx:iIEJa3dALFOiSLLjgnDmi9aoQhXv3RPECkYqT7g1RHP2adkEmykZrw>
    <xmx:iIEJa8qA3earb2eLdmp47-BtoV8yPq8yTWRaWoRel8PDJnJeVnHY0A>
    <xmx:iIEJaxlXaMhF5eEyVHpn286RnZL_mVvNvq6vSm5tygHQ6NJo_b_3CQ>
    <xmx:ioEJa6eJ_s0BBrQ3Y3CqfP8UUzqSY0Qa5Uyd4Uzh4p5gL1KvOCZ4ToAO>
Feedback-ID: i787e41f1:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 27 Nov 2026 08:11:36 -0500 (EST)
Date: Fri, 27 Nov 2026 14:11:56 +0100
From: Greg KH <greg@kroah.com>
To: dickson.wu@certik.com
Cc: cip-dev@lists.cip-project.org, Pavel Machek <pavel@nabladev.com>,
	Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>,
	Ulrich Hecht <uli@fpond.eu>,
	Yongchao Wu <yongchao.wu@autochips.com>, linux-usb@vger.kernel.org
Subject: Re: [PATCH 5.10.y-cip] usb: cdns3: gadget: fix state inconsistency
 on gadget init failure
Message-ID: <2026112729-zips-gargle-7886@gregkh>
References: <20261127-cip-cdns3-510c-v1-1-56e5faa149b9@certik.com>
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
Content-Disposition: inline
In-Reply-To: <20261127-cip-cdns3-510c-v1-1-56e5faa149b9@certik.com>

On Fri, Nov 27, 2026 at 12:18:44PM +0000, Dickson Wu via B4 Relay wrote:
> From: Yongchao Wu <yongchao.wu@autochips.com>
> 
> commit c32f8748d70c8fc77676ad92ed76cede17bf2c48 upstream.

There's no need to send cip-only patches to the usb public mailing lists
(or any other lore.kernel.org list).

thanks,

greg k-h
