Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE70736493F;
	Thu, 30 Jul 2026 02:24:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785378258; cv=none; b=egW8dVqm6aSjaSPQqLZoDYVBRqu7pS+lDelLs8zTIZZX4CnUsuJk6AKuO4zRMFmnmzztW0O6vYM9JhQMhG5U/64G8yJn4qbqH2Nby26DRxRcsgEuDzM5uadRG0Qgh0azOzSyUoLpCFzE/j14bfK89p5xvULozBZOyAiRQbUzRUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785378258; c=relaxed/simple;
	bh=uvZa80rFpdPWSxgtrDmVRXb3MBYzMFaqqoaJnzGUmyU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DsAy5T3bGDmr6JWvcqVlkh+BYO4uWgNmilWfMq2uhxIvfj1DooBdQsoCYhY8zfJbtPdAzPTtsSPCfX1y+4q6uRMiizZgFYi3eK7mw1tz/kMmFdnLCQ1lXV/+vbmejQ/W3K6lEwgRyaO/4rNkefQFpx7/X00QQg5b5GmJc/v3oU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: be2abae88bbd11f1aa26b74ffac11d73-20260730
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:0a51c8b2-eab1-4c26-a94e-ea828b056080,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:e7bac3a,CLOUDID:27943ee35057ea8f1312002f1a30cf2a,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|136|865|898,TC:nil,Conte
	nt:0|15|52,EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL
	:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: be2abae88bbd11f1aa26b74ffac11d73-20260730
X-User: dengjie03@kylinos.cn
Received: from [10.42.12.246] [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <dengjie03@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_128_GCM_SHA256 128/128)
	with ESMTP id 980932075; Thu, 30 Jul 2026 10:24:08 +0800
Message-ID: <e0c37a75-0569-45ac-acd0-534a24b6e3dd@kylinos.cn>
Date: Thu, 30 Jul 2026 10:24:05 +0800
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usb: xhci: Restore MSI/MSI-X reinitialization on resume
 for RESET_ON_RESUME hosts
To: Mathias Nyman <mathias.nyman@linux.intel.com>, mathias.nyman@intel.com
Cc: linux-usb@vger.kernel.org, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org
References: <20260714090210.1201964-1-dengjie03@kylinos.cn>
 <2fd4299c-c455-497b-a122-5f94eeb9d1bd@linux.intel.com>
From: Jie Deng <dengjie03@kylinos.cn>
In-Reply-To: <2fd4299c-c455-497b-a122-5f94eeb9d1bd@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


在 2026/7/27 22:19, Mathias Nyman 写道:
Sorry for the late reply. I've been conducting tests and validations 
these days.
> Is this also an issue in runtime resume where system stays in S0 while
> xHC transitions from D3 to D0, and is then reset?
Runtime PM is not practically triggerable on this desktop setup,
but code inspection shows runtime resume also goes through
xhci_resume() with reset_registers=true for XHCI_RESET_ON_RESUME hosts.
>
> Or is it only in system suspend, or in hibernate?
> Does it matter if xHC was in D3hot or D3cold before resume?
We conducted 1000 tests on Hibernate and did not observe the problem 
recurring.
When it is suspended, both xHC D3hot and D3clod can reproduce the problem.
>
> Not sure if gating with XHCI_RESET_ON_RESUME is the right way as some 
> of those
> xHCI PCI hosts may just need to be reset in resume, but retain their 
> MSI settings.
> (xhci specs states that resetting xHC should not touch PCI config space)
>
> This may just be a ASMedia PCI xHCI issue. 
Additionally, I was able to reproduce the problem using the Renesas 
uPD720201 controller as well.
