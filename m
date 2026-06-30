Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C47729B8CF;
	Tue, 30 Jun 2026 08:43:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782808992; cv=none; b=oAglsKxk4WnXc5TK40DtpYidDD8cxq6RJQv6f0BaWJp31c41fxQcpwEX9BkM+UFtQ3sKWpI9Ftw/BngQRnNeG0N9OnEejlkbdMOS5Q1yA/qASrdNMzlMKbc9ZMnNeSlWKIw74ymtzazd3xXp52loVuWRVCEcBQgFcua78Vatu44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782808992; c=relaxed/simple;
	bh=i9bnSPaOhgCBzHpc0Tte+khwO4IITIbM9OYy9BQLbNU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lLVrhVPO3BL/EFsIs9tXmPh/StBXaLp3ob/rpryccybpRZNPCYxisSMTiYS3b7hpf4l5YaMManFVsSxwcw9zVID52UhBe2hmbOehjbf2S0blAe+ZDyKkf8Ec1OBLKiY8PRqvT9CnW3XoXSadSz/+YGqRtknzEnxnXTHg1sdDr64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: b69ac8a6745f11f1aa26b74ffac11d73-20260630
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:b95b673f-d24a-4416-a505-43c70bdae4e1,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:e7bac3a,CLOUDID:10822412fc28a3c100787c20f5d0b8e8,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|865|898,TC:nil,Content:0
	|15|52,EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,O
	SI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: b69ac8a6745f11f1aa26b74ffac11d73-20260630
X-User: xiaopei01@kylinos.cn
Received: from [10.42.12.251] [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <xiaopei01@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_128_GCM_SHA256 128/128)
	with ESMTP id 1706724835; Tue, 30 Jun 2026 16:43:05 +0800
Message-ID: <939cee9f-d4d7-4b42-8337-f765d39feb10@kylinos.cn>
Date: Tue, 30 Jun 2026 16:43:03 +0800
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usb: xhci: prevent spurious root hub resume during
 suspend
To: Mathias Nyman <mathias.nyman@linux.intel.com>, mathias.nyman@intel.com,
 gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, stern@rowland.harvard.edu
Cc: dengjie03@kylinos.cn
References: <368829d76a12e371e09f203e14b5c80b6515c025.1782804779.git.xiaopei01@kylinos.cn>
 <4ba1dbbc-7597-4042-a443-4ffd292559de@linux.intel.com>
From: Pei Xiao <xiaopei01@kylinos.cn>
In-Reply-To: <4ba1dbbc-7597-4042-a443-4ffd292559de@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



在 2026/6/30 16:10, Mathias Nyman 写道:
> On 6/30/26 10:36, Pei Xiao wrote:
>> handle_port_status() unconditionally resumes the root hub when
>> hcd->state is HC_STATE_SUSPENDED, regardless of whether a device is
>> actually attached to the port.  This can cause system suspend to fail
>> with -EBUSY if a spurious port change event arrives on an empty port
>> after its bus has entered suspend.
>>
>> Fix this by checking PORT_CONNECT in handle_port_status() before
>> resuming the root hub.  If no device is actually present on the port,
>> the event is spurious and should be silently ignored rather than
>> aborting suspend.
>
> Doesn't this change prevent handling device disconnects on suspended
> hosts? 
>
*Thank you for your reply. I’m not familiar with xHCI or these registers.
 Can’t we tell the difference between a real unplug and a situation where
 the device is physically still attached but portsc reports a disconnect?

Thanks！
Pei*
> Thanks
> Mathias

