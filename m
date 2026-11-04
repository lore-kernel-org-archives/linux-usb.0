Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793788561;
	b=4YQEDh7ur3ylWlBZPk53/55zM325JFgDnwZVIRBm/9NIpBZjTqS/F3NcWx8YyVIIZjFk
	 GQby0XqYRGdmQYdpZ4R7lwD+NEWMSpT9zjWLVOi397eGKmEuUY4+Npfz8Q4/lUyCZWxD9
	 bjshGR78wj+L+QEilvcYj2m57ID96kQKlsilfSWubYatf4p8hKRBmUTQTqAwPo+s2Ox+f
	 vqhObpkzcHwM+kP8346zBAwESjqRMnJK8izpg2Tvikbf2IN+/3x7NOmeZVuIfTo6ZzwJ9
	 S0CDcH6amrtau1gzdTB7INuCWp88t6OPfB/jrofErKLCPF3L8TXwnNCLfyuBEKCKobQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793788561;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=MldVb/+aOOdKYyiSqrgWHSz9DK+/h6NC1tJ1ar5necE=;
	b=B4oQOrRI54EzY6Z2j2sT8NhaB7DyIW8X0z1EALDZb0p1UJ1WSbpkAmqpAAA2QQcjl6n7
	 KIucjvQzdy1QG/PHFN9zgj9KIMvd5J24O/Lj6XAXfYwLxgM5eiQNVtfWtCVn3S9F0IVf0
	 WrvoH1PNdcr4EAXTi5ll2B7aDuax1JEIuWyiGoQueIaiOKrL9PjfOehpusiLKj54Bd/DB
	 ldgQTBkaiBLv3Jsyh8y0KjU7wgJlVwalSLAvZSf0sF7JZ6aQUz21ehx8Rum8XEGYxBLoo
	 hp6e9/2Q/Tg4izUCwH/pdK2O3tDKLXk0W/FSRsxvqSD8qZDZuwYhsvAb1sUhaz8fDYw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=gk6DvSHQ;
	arc=none smtp.remote-ip=198.175.65.9
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C92D2606A326
	for <linux-usb@vger.kernel.org>; Wed,  4 Nov 2026 10:36:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C92D2606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=gk6DvSHQ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793788560; x=1825324560;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=Awr5k+k/87WU0j/eAZXhy+I5vTXRIHvOcC8PwNXCJok=;
  b=gk6DvSHQlmkUylDFrHLuPjWeUoa+YERjDWLgV9LIdNKkadQOfCALqgcm
   CIOtSjHodt5rs1xlkV90k0QZSQ7/3wrsjUvWCItIw4Ooq3sUpaGM7v2sU
   8xghwPK4sycBJn9PBQiIIY03GYogByy6d10O2hlYQTMvk+/ZstPZzyFr1
   8cifJhhiSaUWFr4nwYj/ZtoVoVKKL36rY0niPwnbGVxOEsrFJWLlHi+pn
   gXP0teosbSNCYLTBWhwSE5KviDIma8aaT7KTJ0bg7GXhG6jlF7qid7xeW
   Pc4X0FANQ0UY5Uk/g1WfPt8PnG8iV/F8j7FkTrBm2+HQud670BbEwsTCF
   w==;
X-CSE-ConnectionGUID: P7a4a9phTNWK2Qt0saPA2g==
X-CSE-MsgGUID: Y5aD6zysRpSUvcyEGKZaJQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11955"; a="2436143"
X-IronPort-AV: E=Sophos;i="6.27,195,1787036400"; 
   d="scan'208";a="2436143"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2026 02:36:00 -0800
X-CSE-ConnectionGUID: PWKc1p/KScmGUF7BibSZug==
X-CSE-MsgGUID: jaVbYM0xTyqgS36R6o6YrA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,195,1787036400"; 
   d="scan'208";a="7007344"
Received: from slindbla-desk.ger.corp.intel.com (HELO [10.245.244.25]) ([10.245.244.25])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2026 02:35:59 -0800
Message-ID: <8f3e1ab8-9efa-462e-8959-600968c96c54@linux.intel.com>
Date: Wed, 4 Nov 2026 12:35:57 +0200
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
Subject: Re: xhci: Gen2 root port links reported as SuperSpeed when port
 capabilities have different PSI tables
To: Anton Bulakh <him@necauq.ua>, Mathias Nyman <mathias.nyman@intel.com>
Cc: linux-usb@vger.kernel.org
References: <8a954797-4eb4-44db-b53f-6e83f4b7b03a@necauq.ua>
 <2b7017e3-2a3a-4ddf-8a47-54f85174893a@linux.intel.com>
 <0e499195-2143-4e55-9f90-1040c8d251b2@necauq.ua>
Content-Language: en-US
From: Mathias Nyman <mathias.nyman@linux.intel.com>
In-Reply-To: <0e499195-2143-4e55-9f90-1040c8d251b2@necauq.ua>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 11/3/26 21:06, Anton Bulakh wrote:
> On 12026-11-02 17:35:27, Mathias Nyman wrote:
>> code below should do that, does it work for you?
> 
> This worked great on my setup, on 6.18.59 + your patch that VL822 hub (Gen2) shows for each tested port (dmesg):
> 
>    port 10 (4-4): usb 4-4: new SuperSpeed Plus Gen 2x1 USB device number 2 using xhci_hcd
>    port 9  (4-3): usb 4-3: new SuperSpeed Plus Gen 2x1 USB device number 6 using xhci_hcd
>    port 7  (4-1): usb 4-1: new SuperSpeed USB device number 9 using xhci_hcd
> 
> sysfs speed is 10000 on ports 9 and 10, and 5000 on the Gen1-only port 7, as expected.
> 
> On the other controller (0000:0b:00.3, all ports Gen1 only) the hub shows up as SuperSpeed (5 Gbps) on 6-3, the same as without the patch.
> 
> The root hub BOS of bus 4 now has "Sublink Speed Attribute count 4" and "Sublink Speed ID count 2" (IDs 4 and 5).
> 
> Thanks,
> Anton

Thanks for testing, I'll turn it into a proper patch.
I'll add a "Tested-by: Anton Bulakh <him@necauq.ua>" tag unless you object to it.

Thanks
Mathias
