Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795446917;
	b=DSuPjjAaOCYZvSkdLCQxoac109JT/ljlEEhrptEGdcvoHQe1HnVFAkmg8I3pOnkFi5JT
	 YXHrcEK8tEynwz+n1o+pTX2e0L44Y2EnKTT9R77OoxEALaehG3/xbo6Etryxa9GBCXYtB
	 /vx0th4wePkFPbRICdiq5ACtmvnOJMNxumGfRWOP80y6OUB98ec6+faQOn2mleOx5FotE
	 E9L68txizs+R+fXoUw2zrAC9u9rZzXz0oDIzoQvS1KnEhqs+iTgsdF8CksDAsW4YXuXRW
	 R3SvdbZ2iv/3nx8a8ndRca9nPi32mAw+8HPDCBSIkLzLoKjpZteGP/jbhh0qpvO//0g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795446917;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=bpiG9MmqnAFmQietc5A+K0l71MqHDBn6sIcnbHCBX2Q=;
	b=Iz1ZXlLPISbEKlJZWZb/3pW0oD8j9K0raxUxoFa0fNnA5+SSfibJj6DNN+XZuRLGUhi3
	 YRiLPTrnzYytqZTUyFvsKXATr/Tm1Q3g2iW/vZVDrmOkXvavEGdMU3gCac2QuNZSKipo1
	 /njyH4UalNsmCMwtGfhPwp3x3eEZKP+AE4KFmZhfqZItn1DiAmF9Vv7xArNCSaALOK4g0
	 8fuU1OvToWP6g1qzXiQs1XOeg0V6MAuU6JKltWg8PPZGXtSOExx3NCfiMRygL9C8yTJjf
	 ELZimXoAnlmiMSna/GX9ic0ZgR1vNVleMs3m17HEn218uhKxiY5F6QU6d6WFA7rdGFg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=MyMrtHhe;
	arc=none smtp.remote-ip=192.198.163.18
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 471AD606A31A;
	Mon, 23 Nov 2026 15:15:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 471AD606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=MyMrtHhe
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795446916; x=1826982916;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=xZ6/Tf8K2RVNUu5K1v99pgqDv7SlO/Pg58bdgY94QLM=;
  b=MyMrtHhe9Yo3Fbv5e73D7ujbmZsrArq25iIt0gOWpufF9/TQ6TtJ6FTv
   MiG5J8akQ5CDGnxOXjyfRSOQU0Tp0yviumDiSZpX7yT68WE6mHolbv2od
   ZG94F9goOqqvQzpbb1rMaJfIz9Nb2Sfr862mJDCPjbAEDVTsE2zG2HFAU
   ttljh6MWFRQcDLgED2vkpknBlFH/CDg85uK8KDkdEnvd0k59qRkPp6PdA
   LRD1AIE+1mll312m7yWwF2ZjYEeG2rp3ktl3V63W0FxJXVcgeTrHOn9qy
   28sZ4vkfM8dNc5GZm3PRb2WpAByvEQeLxWLULjQprmTDwtAtaYsyla+62
   Q==;
X-CSE-ConnectionGUID: VcM92CMmSlWPBPYf1S4wuA==
X-CSE-MsgGUID: 8jBvO/69REKetJ8K24C6hg==
X-IronPort-AV: E=McAfee;i="6800,10657,11975"; a="4283385"
X-IronPort-AV: E=Sophos;i="6.27,229,1787036400"; 
   d="scan'208";a="4283385"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2026 07:14:57 -0800
X-CSE-ConnectionGUID: Q9y8a0k5QW2fkEo540VhNQ==
X-CSE-MsgGUID: WUpbA1WURIK9YOjB8teUWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,229,1787036400"; 
   d="scan'208";a="11578799"
Received: from mkosciow-mobl1.ger.corp.intel.com (HELO [10.245.245.59]) ([10.245.245.59])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2026 07:14:55 -0800
Message-ID: <2ffafaa3-bdea-4d67-b224-2f18d76134be@linux.intel.com>
Date: Mon, 23 Nov 2026 17:14:53 +0200
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
Subject: Re: xhci: unratelimited "buffer overrun event" warning floods log
 (~7000/s) with USB S/PDIF capture device
To: Michal Pecio <michal.pecio@gmail.com>, Alex Kononov <alex@albefly.com>
Cc: 'Mathias Nyman' <mathias.nyman@intel.com>, linux-usb@vger.kernel.org,
 'Takashi Iwai' <tiwai@suse.com>, linux-sound@vger.kernel.org
References: <001801dd7985$c068fc60$413af520$@albefly.com>
 <20261121103029.7af20ec4.michal.pecio@gmail.com>
Content-Language: en-US
From: Mathias Nyman <mathias.nyman@linux.intel.com>
In-Reply-To: <20261121103029.7af20ec4.michal.pecio@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/21/26 11:30, Michal Pecio wrote:
> Hi,
> 
> On Sat, 21 Nov 2026 01:58:44 -0500, Alex Kononov wrote:
>> Good day Mathias,
>>
>> With a USB S/PDIF TX/RX adapter (Savitech, 262a:9123, UAC2, high
>> speed), the xHCI driver logs an isochronous buffer overrun warning
>> for nearly every microframe while the adapter's S/PDIF input has no
>> signal:
>>
>> xhci_hcd 0000:00:14.0: WARN: buffer overrun event for slot 2 ep 4 on
>> endpoint
>>
>> Rate measured: ~433,000 messages per minute (~7,200/s).
>> systemd-journald sits at 100% of one core and reports "Missed N
>> kernel messages".
>>
>> Setup:
>> - Intel N100 (PCH xHCI 0000:00:14.0), Debian 13
>> - Kernel: 6.12.117+deb13-amd64 (same code in mainline 7.4-rc3)
>> - Capture stream open continuously (CamillaDSP), 48 kHz S16_LE,
>>    EP 0x82 IN isochronous, adaptive, 125 us interval
>> - TV feeding the S/PDIF input goes idle -> no input signal -> flood.
>>    With a valid input signal the count is 0.
>>
>> The device is clearly misbehaving (it sends more data than requested
>> when the S/PDIF receiver is unlocked; it also reports its clock source
>> as valid while unlocked).
> 
> Either the device is buggy or snd_usb_audio driver submits wrong URBs,
> but that's a sound subsystem issue.
> 
>> The driver handles the events correctly and audio recovers fine. The
>> problem is only the logging: the warning in handle_tx_event() for
>> COMP_ISOCH_BUFFER_OVERRUN is not rate-limited, so a single
>> misbehaving isoc device can generate thousands of lines per second.
>>
>> Locally I changed that xhci_warn() to dev_warn_ratelimited() and the
>> rate dropped to ~100/min with no functional change.
>> Would a patch rate-limiting this message (or demoting it to xhci_dbg)
>> be acceptable?
> 
> Not Mathias, but I think it should be xhci_dbg() like all the other
> conditions which are device-triggerable rather than driver bugs.
> People can still see this as -EOVERFLOW status in iso_frame_desc[].

Agree, xhci_dbg would be better.

Alex, can you respin this patch with the xhci_warn() -> xhci_dbg() change?

Thanks
Mathias


