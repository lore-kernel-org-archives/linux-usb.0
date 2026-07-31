Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF9A237FF50;
	Fri, 31 Jul 2026 07:38:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785483525; cv=none; b=Mo+3DE/I3Wg38oAr20GVpv03wvn8EeLILNXrWC5jvvWGhW2YOR/bloGQzZjedHL6MjoCF1kVr68S+H9NcWvoG5O1X2LCqN9VVcfeCwOOGfxijSaZqcZjBphUKQcdgFJ3HZXio2qNm2pHe0Y9VDLy/FCzzlq0biwChvOuxLTL64w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785483525; c=relaxed/simple;
	bh=W7gV+OOSxHM1t9uWiBPs5wgcT+btDwaGnFh9VrvuZPs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BINKMqYT53Snz8sKn3HoqOvLSv9qQVBLqs8OCQK3GRQWQN1rRZgTX4J1xxDpnyVEm2STSBhc9qzNiPTAgUO04Vg/XSE0pjuxTJEZ/ouNNc7frUPk8KkzbElzEZ6WwCOa8YXlL9b9qXLdIkcHpC8GGumEtgvI+ABVXuqHnjWuEzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: cfcedd2e8cb211f1aa26b74ffac11d73-20260731
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:bb038368-4d00-4ff7-985f-0e182a88de65,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:e7bac3a,CLOUDID:7d726a186a71177a892c936a3fbca6f7,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|136|865|898,TC:nil,Conte
	nt:0|15|52,EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL
	:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: cfcedd2e8cb211f1aa26b74ffac11d73-20260731
X-User: dengjie03@kylinos.cn
Received: from [10.42.12.246] [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <dengjie03@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_128_GCM_SHA256 128/128)
	with ESMTP id 1086824922; Fri, 31 Jul 2026 15:38:24 +0800
Message-ID: <d71b1b08-eae8-4e0a-a58f-bbd6b131d5cd@kylinos.cn>
Date: Fri, 31 Jul 2026 15:38:22 +0800
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usb: xhci: Restore MSI/MSI-X reinitialization on resume
 for RESET_ON_RESUME hosts
To: Michal Pecio <michal.pecio@gmail.com>
Cc: Mathias Nyman <mathias.nyman@linux.intel.com>, mathias.nyman@intel.com,
 linux-usb@vger.kernel.org, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org
References: <20260714090210.1201964-1-dengjie03@kylinos.cn>
 <2fd4299c-c455-497b-a122-5f94eeb9d1bd@linux.intel.com>
 <e0c37a75-0569-45ac-acd0-534a24b6e3dd@kylinos.cn>
 <20260730064817.79e3d1af.michal.pecio@gmail.com>
From: Jie Deng <dengjie03@kylinos.cn>
In-Reply-To: <20260730064817.79e3d1af.michal.pecio@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Thank you for your reply.

在 2026/7/30 12:48, Michal Pecio 写道:
> To avoid putting PCI-specific code in xhci.c, I wonder if it would
> still work if the disable/enable cycle is done by xhci_pci_resume()
> before calling xhci_resume()?
The architecture is indeed cleaner. I will reply to you after conducting 
the test.
> I wonder if it's an issue with those chips or a general PCIe or IRQ
> resume bug in some particular host system? It looks like nobody else
> complained about this old patch for three years.
>
> I don't have ASM3042, but I do have ASM1042, ASM1142, ASM3142 and
> also uPD720200, uPD720201 (rarely available for testing), uPD720202.
> To be honest, I have never seen lost IRQs after resume here.
I was testing the S3 reproducibility issue on the ARM64 platform
  (uPD720201 requires manually adding the XHCI_RESET_ON_RESUME quirk).
  Next, I will conduct a comparison verification on the x86 platform,
  which will take some time.
> How often is this supposed to happen, how exactly is it reproduced?
Approximately 200 iterations of S3 were needed to consistently reproduce 
the issue.
The S3 test script is as follows:
#! /bin/bash
#
for i in $(seq 1 $1); do
     echo "the $i th s3" > /dev/ttyAMA0
     echo "the $i th s3"
     rtcwake -m mem -s 20
     sleep 15
done
