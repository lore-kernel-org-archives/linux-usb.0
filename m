Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.15
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793100608;
	b=rAgiUx+onl6cNHCkEp5F6uH7d9PbuCObTuWPDHq0xxjBPVUANsTG1/G/kcw0L8eZDh73
	 9IvvF2/Pl+juJ9JKnZLd/GNGQCYqJfchXhCtjE3mlOxtYFGXTNJUdmEVtkPlHbZkC9kmj
	 OVyF4s4SJzlgRJPC+x28+RgjeDgYT79/ZXIOwmel8r8FOT0Qd12flQM0T7nYAigSm37LS
	 6C6yv/g1dLoafLU4KL69iXrgTZfrI6YQTWaerZytOftbujN6CLJqQg7s22AbuPwYcfkqs
	 L9wk9OY9uoV9ugAn2n+wA/J6aTXo9peCIqIEY+FMnTsc5AkakN4L2J/Pn9TAIKar3+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793100608;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=jgHbsSZxgICI1R3iyhbWfFo+ooGFEyZvxmzQdqMHGmU=;
	b=j7vxGmbFX8Rmc5WZZWYO9OAq/n6sD6AgcZkLNdAubfEVKBnX1iTYtYnSvEmU/E5IF7LX
	 hM9gVmRt0Niwkv7Ih2K9myQBVooFk1BkIY7JBJxdLqD+6cpgJvCb6jpj2NjfFNZ/6BRf0
	 9ERTZnMYoAGCOHOUn+l+62viUx3jC3PoGMENPZp5ayW3e1Ieg5jLwumEr+ktD7SHnewNj
	 wRzbvJa7zkuzhSdLpUa3TwFGXdbL16b6dtzOKu3PNqVvS3cnDKaPOgb1/Bkyh3cDJkygp
	 DOL+FcgF1Ny4ttN0seTC8/Tyln+ryKLGUAq7l0KrgrJ+jtrMBsVpyH7vMZWvtBKOtdA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=NGFwyLdZ;
	arc=none smtp.remote-ip=192.198.163.15
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 026E4606A324
	for <linux-usb@vger.kernel.org>; Tue, 27 Oct 2026 11:30:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 026E4606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=NGFwyLdZ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793100608; x=1824636608;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=1yeqnc0ta2UV2WQYpoCquJFZeYZEWhe8twDoXAu1x8I=;
  b=NGFwyLdZmqWFRGwPWx0uLHZFDxpwFMiGoFaX9vdOs486KmQLu9OBcIg3
   aJlnayAGT5SfMa6oeWibipTVgyNO4fcBVBaIM+rwXqSmufKizZcQVyp9x
   6Ng/Aghc0aWYwIpJP1ESxmUvoXhIStqQcZABJNUujtrYyL9u5Yytt/GTk
   nK+1oZZrSXRDDtdM3686hvkVcEJItKHgNhEkwt5ZNHcuw6HCTmpbvjL2R
   71q2slZe9uLqxzzCb1wExUV1zrnJjNyZ29BF/3Ow+EteXmjHOu3Lb+mOA
   m8Gz3VYuwIYWgrpI/ooSxyDRSWWLCs88PRZROvMsoNM7RpoefDY5jWe6F
   Q==;
X-CSE-ConnectionGUID: ffreEzDLTwSeEwyqFlh4HA==
X-CSE-MsgGUID: +MW1JMMYRVOKlP3C2t2iwg==
X-IronPort-AV: E=McAfee;i="6800,10657,11947"; a="1805708"
X-IronPort-AV: E=Sophos;i="6.27,181,1787036400"; 
   d="scan'208";a="1805708"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2026 04:30:07 -0700
X-CSE-ConnectionGUID: nuancx0yRQSDa3yvFLtwyA==
X-CSE-MsgGUID: MiYDNk2NSDKl6Jdyl7FOug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,181,1787036400"; 
   d="scan'208";a="5043352"
Received: from nneronin-mobl1.ger.corp.intel.com (HELO [10.94.252.51]) ([10.94.252.51])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2026 04:30:05 -0700
Message-ID: <b03216c5-52e5-4fdc-a114-993f4a75b190@linux.intel.com>
Date: Tue, 27 Oct 2026 13:30:02 +0200
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
Subject: Re: [PATCH 1/5] usb: xhci: clear stale bandwidth data after
 hibernation
To: Michal Pecio <michal.pecio@gmail.com>
Cc: mathias.nyman@linux.intel.com, linux-usb@vger.kernel.org,
 Harald Judt <h.judt@gmx.at>, Lovekesh Solanki <lovekeshsolanki00@gmail.com>
References: <20261006152427.3735383-1-niklas.neronin@linux.intel.com>
 <20261006152427.3735383-2-niklas.neronin@linux.intel.com>
 <20261006181254.309bde85.michal.pecio@gmail.com>
Content-Language: en-US
From: "Neronin, Niklas" <niklas.neronin@linux.intel.com>
In-Reply-To: <20261006181254.309bde85.michal.pecio@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 06/10/2026 19.12, Michal Pecio wrote:
> On Tue,  6 Oct 2026 17:24:23 +0200, Niklas Neronin wrote:
>> Controllers using software managed bandwidth accounting maintain
>> periodic endpoint bandwidth information in struct 'xhci_interval_bw_table'.
>>
>> Each root hub port owns a bandwidth table and a list of TT bandwidth
>> domains, where each TT has its own bandwidth table. Virtual devices
>> reference the bandwidth table of their current bandwidth domain through
>> 'bw_table' or 'tt_info'.
>>
>> Historically, resume from S4 re-allocated the entire xHCI driver state,
>> which implicitly cleared all bandwidth accounting data. After the
>> hibernation resume path was optimized to preserve parts of the driver
>> state, virtual devices and TT bandwidth information were freed and
>> recreated, but the root hub bandwidth tables were left intact.
>>
>> As a result, stale bandwidth accounting data could remain in the root
>> hub bandwidth tables across hibernation resume, leading to incorrect
>> bandwidth calculations after devices were rediscovered.
>>
>> Fix this by resetting all software bandwidth accounting state in
>> xhci_rh_bw_cleanup() so that resume starts with a clean bandwidth state.
>> This includes 'xhci->num_active_eps', which must remain consistent with
>> the cleared bandwidth tables.
> 
> If that's the case then it would make sense to put this inside
> xhci_rh_bw_cleanup() rather than xhci_resume(), wouldn't it?
> 

Function xhci_rh_bw_cleanup() handles cleanup of root hub bandwidth states,
while 'num_active_eps' is a controller wide active endpoint counter.
Since it is not part of the per-root-hub bandwidth accounting state,
I left its reset in xhci_resume(). It also lives in struct 'xhci_hcd'
rather than the root-hub bandwidth structures.

I'll adjust the commit message in the next revision.

Thanks,
Niklas

