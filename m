Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4334C1C68F;
	Wed,  3 Jun 2026 00:25:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780446351; cv=none; b=FT6KHe9JbJ9gBB7x/n3hTHqbrNgzW4ShNnkl6RWWkwl5daJVbLB1x3tpKf5HlNkTkS+OoEeCUinjBF3ISwFZawlueT/Gr7sfZGiBAxpg6Xk6IWauCeTPLgPH9/LYjo/o3WrzZTGGjZQlc4g2hAIuslOEg5RKCviebWRqqAE6dIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780446351; c=relaxed/simple;
	bh=QvKz14nTALqMB6UTphP+OJ0dmo5QB84itAc35ZpBhcA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Vj3Ul7zp3Ioym4va7QTFxkjJ9FkFhlrqHAfOYr1+mvZYixPI/ziDOG+DCFe4tnfUgFD8EmQ594VhThIxBbeYmFEZyrN1FwboRT7nhKoEvrPAJt7tpaaooTNMhqSlMZwSc2TJegb9o2RDhLa8VFgtKPVpV9J88ZxNT2F/EEAfwCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=c4+4ggKE; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="c4+4ggKE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780446350; x=1811982350;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=QvKz14nTALqMB6UTphP+OJ0dmo5QB84itAc35ZpBhcA=;
  b=c4+4ggKE+UEwHe7jiAcwdHPEKgdutolRz8Tau+OcCx3cMnSxpYERLCtj
   3Ty9klmP2ggbXyHCmRKHT1wTxuHtbW/BOEVMH6sjQAcMIieTXQ2+CqY7V
   pDc329r3spySyEjvoFF7NXIKpHqIrZ9ySYcViMUraM52Op1VehNuuVKJM
   VguyyTTAl7yVlnFsCnP42aBr+sWmt52CeTsrA4HClxB4XE19vDyjqjPSb
   MEQ5gOEure3ZpbI8yR3wRzWegAqnat96QZnR+8wDlacB8B7mqmeHb59TW
   njlgukN8Nn+Afc9anLQrIY2oP9daFWkpyDusKYDzYbEdRVAu25Lx/FZEt
   w==;
X-CSE-ConnectionGUID: OSMMCJ5vQSG4YZx6DK9E3A==
X-CSE-MsgGUID: 3VN2tjlQT82s1t3wJpnopQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11805"; a="92729020"
X-IronPort-AV: E=Sophos;i="6.24,184,1774335600"; 
   d="scan'208";a="92729020"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2026 17:25:49 -0700
X-CSE-ConnectionGUID: P+qxy5D8Ss25+jLjqg360w==
X-CSE-MsgGUID: EeItp+ObRnyznZY84yr5Wg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,184,1774335600"; 
   d="scan'208";a="244146159"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.244.116])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2026 17:25:48 -0700
Date: Wed, 3 Jun 2026 03:25:45 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>
Cc: Andreas Noever <andreas.noever@gmail.com>,
	Mika Westerberg <westeri@kernel.org>,
	Yehezkel Bernat <YehezkelShB@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Michael Jamet <michael.jamet@intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	Yehezkel Bernat <yehezkel.bernat@intel.com>
Subject: Re: [PATCH 6/6] thunderbolt: property: Make entry key modifications
 more visible
Message-ID: <ah90iSyO3ct0ulTV@ashevche-desk.local>
References: <20260524-thunderbolt-big-endian-v1-0-6044edca78e7@weissschuh.net>
 <20260524-thunderbolt-big-endian-v1-6-6044edca78e7@weissschuh.net>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260524-thunderbolt-big-endian-v1-6-6044edca78e7@weissschuh.net>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Sun, May 24, 2026 at 03:06:48PM +0200, Thomas Weißschuh wrote:
> The modification of the key directly through the entry pointer is
> confusing. Explicitly use the key member.

...

>  struct tb_property_entry {
> -	__le32 key_hi;
> -	__le32 key_lo;
> +	u8 key[TB_PROPERTY_KEY_SIZE];
>  	__le16 length;
>  	u8 reserved;
>  	u8 type;

>  	if (!tb_property_entry_valid(entry, block_len))
>  		return NULL;
>  
> -	convert_dwdata(key, entry, 2);
> +	convert_dwdata(key, &entry->key, 2);
>  	key[TB_PROPERTY_KEY_SIZE] = '\0';
>  
>  	property = tb_property_alloc(key, entry->type);

>  	list_for_each_entry(property, &dir->properties, list) {
>  		const struct tb_property_dir *child;
>  
> -		convert_dwdata(entry, property->key, 2);
> +		convert_dwdata(&entry->key, property->key, 2);

In such case this should use the get_unaligned_le64() or le64_to_cpu() rather
than this strange thing...

-- 
With Best Regards,
Andy Shevchenko


