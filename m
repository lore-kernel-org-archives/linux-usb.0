Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.14
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795624431;
	b=jzDo15bKd+ufXf9+xNz/7xMceVBTs3LGJynQWG4pLsSDn6AzEPGhRfHZBTQJItyzTdV9
	 r3lB8TV67/9VBjwTKPmUqDzPgZZS5ggIesJ0irBsz5fbIiEroSElhu/UJejWUrmwdttGm
	 rU6uwz3jkD88UMnu6H2MTM4/sUmXEUCfRg89o1lqrMcYmxJXSsl+gtEc3+OVy3TRspKow
	 1LHvucq0Go4yZ+Tx3mR3rX+6bSl5BJlVJNzokoCCgp8PvWLKD6FuyNXgqzfl8OSLKymt4
	 U2wSSiEeOazIcGLCKx0U3TFnmb0s7UgiL18HmbkT9SU9CUWtGZhJVsKBnBqpQT9e45g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795624431;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=wqiGTtgHklt+C+cfeclp3AAoyPDeAKFY3e/UAHLzSAA=;
	b=xmMQAM8qfiwLjoCBY4aLh3k74yKd1zNvcHIJrjhRupH3QJF/if1cA0/6OMPj7VkdFSdo
	 E5D/07vX49EqRA4bJkoY0uXnXtO47p6u4iFieBrNtycNN73qyfCmItfAoZxh8JND1/frM
	 gY9ARN7JsVdeG7gYiKvet7VxTN0vQI83kQVKZV86JvzyXmpW2kGBVvme1CWJGOMtRJUzx
	 K9vOUZcf0M2HYTZo2XTmz8Ct6xBj4TFAhBExmqqCQPJbgTVIvX4z5j0zkCzD1kb4/WtyN
	 TTszQ2eZ0SbcB2TnE6EbJIy89mlY62Td/3SVf3Sac01Pg9nD/XRfrZ7FnWr2fHCJcfQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=OcROJi0t;
	arc=none smtp.remote-ip=198.175.65.14
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04B53606A33B
	for <linux-usb@vger.kernel.org>; Wed, 25 Nov 2026 16:33:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 04B53606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=OcROJi0t
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795624429; x=1827160429;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=DaYDUI6xbgUH7M68M+aQvsqQv6UNBJKfQgF6V96C34k=;
  b=OcROJi0t3C0BRvWJK+qJxHDG6a0Y4OnVTkab7ikpAYr8me1lCpVAab07
   kjIlUf2Urx8p1OaX3ssjMo1rCSqXDPiERvdCHdNvys79DEZrKhoPLE8Lv
   1vLI8GRb3AjUD/bYH16grSGFhdTcdFrScl7HwJM95v9BQourjW20w2120
   g+yjbW763NXd1xLQpENC4WNUbttxNoWolIjaazI8pcpvu4dCEfJv6DwPo
   68Kdj7jDPcf1E0sxYPWDwH7QZYTyh9N3sOdh4Fs8C6vpUbxvG2OjJJcB9
   bCgzT49surlPHMrbUng6+0wBKL+HYMOyRgRgYBrJETZJqV/h/qQGiqRhW
   Q==;
X-CSE-ConnectionGUID: wX5yHo9VQmeUNopbUjp+qg==
X-CSE-MsgGUID: EVs4bxObQryZiFgnY8MAvQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11977"; a="4414381"
X-IronPort-AV: E=Sophos;i="6.27,233,1787036400"; 
   d="scan'208";a="4414381"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2026 08:23:34 -0800
X-CSE-ConnectionGUID: dIw6MwzDQY67Qt2x5wlPLg==
X-CSE-MsgGUID: BQxYH++ITC6sX1tWMJntTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,233,1787036400"; 
   d="scan'208";a="12121179"
Received: from inaky-mobl1.amr.corp.intel.com (HELO [10.245.244.80]) ([10.245.244.80])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2026 08:23:33 -0800
Message-ID: <19d54918-d5da-4026-9712-16dee83c5179@linux.intel.com>
Date: Wed, 25 Nov 2026 18:23:30 +0200
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [[RFT PATCH v2] 0/2] xhci: sideband: fix use-after-free of stale
 virt device pointer
To: Wesley Cheng <wesley.cheng@oss.qualcomm.com>, quic_wcheng@quicinc.com,
 hulianqin@vivo.com, selvarasu.g@samsung.com
Cc: linux-usb@vger.kernel.org
References: <20261119214841.1552318-1-mathias.nyman@linux.intel.com>
 <633ae539-f386-41e5-a852-55b5e1b19d64@oss.qualcomm.com>
Content-Language: en-US
From: Mathias Nyman <mathias.nyman@linux.intel.com>
In-Reply-To: <633ae539-f386-41e5-a852-55b5e1b19d64@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 11/24/26 05:00, Wesley Cheng wrote:
> 
> 
> On 11/19/2026 1:48 PM, Mathias Nyman wrote:
>> Hi
>>
>> Second attempt.
>> These two patches attempt to improve the disappearing vdev issue
>> while sideband stays active.
>>
>> I don't have real harware to test this on so all review comments and
>> feedback from testing is welcome.
>>
> 
> Hi Mathias,
> 
> Tested this on our platform and it was working well.  I also injected/simulated the initial error that was reported by Lianqin, and this series was able to mitigate that error path.
> 
> Basically forced a reset_resume situation and overrode command->status = COMP_USB_TRANSACTION_ERROR to always happen in the reset_resume situation. Was able to observe the error w/o the fix and wasn't able to reproduce a crash after.
> 
> Tested-by: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
> 
> Thanks
> Wesley Cheng

Thank you all for testing.

I'll add your Tested-by tags and queue these patches up for usb-linus

Thanks
Mathias
