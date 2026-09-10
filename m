Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 539521A683E
	for <linux-usb@vger.kernel.org>; Thu, 10 Sep 2026 05:09:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789016985; cv=none; b=Zw2FgeRnYoPG3TdFgKuBA6BLA1GKUQ51aNQOkqt0ykSPye0mOcHhggR8yc6ZRz5B+SNnZRNEYSLt3vc8dFyKrXR43iOzWtbUKzDqaOYIgyz0gOoYGxyn0DKjQhs7PJe13jVG2fSp3Z3WB8hnxL6HK5oS7MYx4kOvwI+A8m1PSVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789016985; c=relaxed/simple;
	bh=OIqbaUgDKLmyGVZ4RBBA6nplv5NXln8VdP+jka+Abr0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tc3DzbN+2zk82gcsdn38OpXkEAbD5w2cTiCU4PMndiUcy9tOtmIiEUp6mltzi7r6dzZ77ZIoOstTwrZUDrmA3oAlt2oHzmCwpwqgUIvwFTa+h3EnZL1VtY3ya4INisuWnUvDTdzbndArDOn2CdnAoYcOxgZ5+Wata4nMjeWoRGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZBtn6Jcu; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZBtn6Jcu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789016983; x=1820552983;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=OIqbaUgDKLmyGVZ4RBBA6nplv5NXln8VdP+jka+Abr0=;
  b=ZBtn6Jcu3xDzvTFKll9HKb99nDjzPZVm06Ot3V+RJy/aAjC0fRf+oRq9
   vTg3nG5GvilEqOQLcjA8VSyYg4ZKNom/vu9eD5MMZYZgt4DkDXH5IbAM8
   JKsI50WSW3tDG6euNUQ3ZvEcju3emmzUl6r2U+4fwOW5hLtGZDHEtlj+J
   0Lwg0kCQJkhcAx6WZML2zud9i5DauLfNkMte9woH7RzIQUQG1MqMYTDCI
   vTFUI8rRY1AJ1Bi0Krqm2/vQZjPHl1fzIZQ2dsS8DAjyXdQi91g6/FzSV
   XRIULIcuz77tKv2qCDIFVX2jmQLfhSK8A2fNp1JJoEnhcC9YOnp68QUIi
   g==;
X-CSE-ConnectionGUID: nPPNlQF1TNCsnTOMPwEMzw==
X-CSE-MsgGUID: U/wGzFeSQ62hsW8MQw+/JA==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="89330632"
X-IronPort-AV: E=Sophos;i="6.25,271,1779174000"; 
   d="scan'208";a="89330632"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2026 22:09:41 -0700
X-CSE-ConnectionGUID: P8B8azEGSNOiiljN9/eycQ==
X-CSE-MsgGUID: r6Q0l1ZvRpmN6nBr15Akig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,271,1779174000"; 
   d="scan'208";a="272018489"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa009.jf.intel.com with ESMTP; 09 Sep 2026 22:09:40 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id A24E999; Thu, 10 Sep 2026 07:09:38 +0200 (CEST)
Date: Thu, 10 Sep 2026 07:09:38 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: linux-usb@vger.kernel.org
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>, Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>
Subject: Re: [PATCH 0/4] thunderbolt: Couple of improvements for USB4STREAM
Message-ID: <20260910050938.GP106095@black.igk.intel.com>
References: <20260903123455.2048076-1-mika.westerberg@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260903123455.2048076-1-mika.westerberg@linux.intel.com>

On Thu, Sep 03, 2026 at 02:34:50PM +0200, Mika Westerberg wrote:
> Hi all,
> 
> This includes a few cleanups and then two improvements for USB4STREAM,
> useful when it is in the default "interrupt" mode. First one is to avoid
> read-modify-write on the interrupt mask path and second one is to use the
> same ->start_poll() mechanism that the Thunderbolt/USB4 networking driver
> uses.
> 
> Mika Westerberg (4):
>   thunderbolt: Do not WARN about already disabled interrupt on polled rings
>   thunderbolt: Clean up ring interrupt register indexing
>   thunderbolt: Use shadow copy for ring interrupt mask
>   thunderbolt: stream: Use polling with RX ring

Applied to thunderbolt.git/next.
