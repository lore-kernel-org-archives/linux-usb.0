Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795079490;
	b=C1L+iuYh0ghlCFlY2N5mm+DuX7VoIoPmQ2ajWFylihBon/SE05YI+usWJW0d6hAAdl8y
	 kKosVgF2KbjXdgKf9exqAQW4y1Ur9r+pL+/q9jIYBUCWUbEgFEy2ZMsRYxn05JesPaI8p
	 l719dSq1t8AuoBGAMRtyDdPxh/93PhMy/FrB05RuDtudeEsaGQn2r60Oh4We2FfJ5C6IW
	 M0/DSxPnowW8OD6OAkw1lzUcFg0DhP+5JF0GsJ+klIJchUEwqR2DbHzcEXBdOhS9noCOd
	 IyJYCkbGMioIRi5fkR8qS2RnfHLzQfk4ZDRL5l1Lc9HsOoDIS3YPItfL2lIAlMi0ImQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795079490;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:
	 Organization:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=5NY1Amg7hcmlEiqTday3t1vbmS+mq4Kjs69zA33nOkU=;
	b=bIbT+n16ogA9l7hOt74CKQD+HDgzLWoCCtCE5d9eWPJ7N0fDWA+UBN3h/qo1Z0fqWkAU
	 zjoMCQr318E4FQprsTJUlld7xzCLhZloOtwP6pFpS1IiWpCz0Xbvpu8mZHCPUS7SJ1gMT
	 uI3gp+BYqUjaPHWiN4RjikZd3aYxkOOe6QHNYW7NwMLrp3gWTEHP3iXgDnVEWcoaeK+Z0
	 dBE/hc2YP6YL+nEgkEUeCYxU2Es5sTvWg2+7nWWdmRhpwA7MEkBTUgNMTlctUGSq+JlQ3
	 917V9si73g0WH8RugARKv1mfI+0+rIujNaVDWclmgx6FaE18yXS+HPUyYL9lW53WyLA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ESEf5TaI;
	arc=none smtp.remote-ip=192.198.163.18
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B70A606A320
	for <linux-usb@vger.kernel.org>; Thu, 19 Nov 2026 09:11:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9B70A606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ESEf5TaI
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795079490; x=1826615490;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=mrVlz+3pGCUqkhWQwxxjKi6N7AVLYC6RkmtVqjqnoVw=;
  b=ESEf5TaIPf8amcfC5F3zeU6aQs3+M/YOFQAPcrjy2j88cU8RQs0hwTns
   vsg7gohA4Oq3OVu2dijYAk7aTOd6TqFp2VcKaNCq6hTYxsU2uPDQOZvuH
   ThpR2d2Gl6VXZ6Jyu47dYMBzI9p64JnrgsdKKtjunSOo67xzvltjrJOKU
   iLjDyo3AmGqtCaW0CQHiRQ59AWmV2UnC1houhlUv7H4RSUUE+hDec6k5F
   K05fhPSVCbPEUp73xonjT9v/KhecZWE9ZCP+Embeq0eTg+NOicLqvZgC6
   MDHlmS9jRBa7y8l6gi2EV/MnsuMfqUuh/xEdj+rRjKyWp+n9w1bv0nmhl
   g==;
X-CSE-ConnectionGUID: qow9bhTkSu+UYn28a2szlA==
X-CSE-MsgGUID: bPKZMEeZRmO4T3aRwRseTQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11970"; a="3950150"
X-IronPort-AV: E=Sophos;i="6.27,220,1787036400"; 
   d="scan'208";a="3950150"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2026 01:08:46 -0800
X-CSE-ConnectionGUID: XfOWkTUwTxaS9caQQR+c7w==
X-CSE-MsgGUID: tbT/ubBhRiCkjog46wrirw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,220,1787036400"; 
   d="scan'208";a="10374169"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.86])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2026 01:08:44 -0800
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 39A42121B5E;
	Thu, 19 Nov 2026 11:08:41 +0200 (EET)
Date: Thu, 19 Nov 2026 11:08:41 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Hans de Goede <hansg@kernel.org>,
	Antti Laakso <antti.laakso@linux.intel.com>,
	linux-usb@vger.kernel.org
Subject: Re: [PATCH 1/1] MAINTAINERS: Update usbio driver maintainers and
 reviewers
Message-ID: <av68mbd8j7UdvA02@kekkonen.localdomain>
References: <20260803164533.58833-1-sakari.ailus@linux.intel.com>
 <aromZGGDP-rTsNCz@kekkonen.localdomain>
 <8efda53d-3f18-40e9-9c16-92ac2f5c3133@kernel.org>
 <asSsCj4bV-DFnzI4@kekkonen.localdomain>
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
In-Reply-To: <asSsCj4bV-DFnzI4@kekkonen.localdomain>

Ping.

On Tue, Oct 06, 2026 at 11:06:34AM +0300, Sakari Ailus wrote:
> Ping.
> 
> On Mon, Sep 28, 2026 at 10:41:00AM +0200, Hans de Goede wrote:
> > Hi,
> > 
> > On 28-Sep-26 10:33, Sakari Ailus wrote:
> > > Ping.
> > > 
> > > On Mon, Aug 03, 2026 at 07:45:33PM +0300, Sakari Ailus wrote:
> > >> Israel's e-mail address is no longer functional so remove him as a
> > >> maintainer of the usbio driver. At the same time, add myself as a
> > >> maintainer and Antti as a reviewer for the driver.
> > >>
> > >> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > 
> > Thanks, this looks good to me:
> > 
> > Acked-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
> > 
> > Regards,
> > 
> > Hans
> > 
> > 
> > >> ---
> > >>  MAINTAINERS | 4 ++--
> > >>  1 file changed, 2 insertions(+), 2 deletions(-)
> > >>
> > >> diff --git a/MAINTAINERS b/MAINTAINERS
> > >> index 88de4216d7d4..d1c26db44ca0 100644
> > >> --- a/MAINTAINERS
> > >> +++ b/MAINTAINERS
> > >> @@ -13430,9 +13430,9 @@ F:	Documentation/admin-guide/pm/intel_uncore_frequency_scaling.rst
> > >>  F:	drivers/platform/x86/intel/uncore-frequency/
> > >>  
> > >>  INTEL USBIO USB I/O EXPANDER DRIVERS
> > >> -M:	Israel Cepeda <israel.a.cepeda.lopez@intel.com>
> > >>  M:	Hans de Goede <hansg@kernel.org>
> > >> -R:	Sakari Ailus <sakari.ailus@linux.intel.com>
> > >> +M:	Sakari Ailus <sakari.ailus@linux.intel.com>
> > >> +R:	Antti Laakso <antti.laakso@linux.intel.com>
> > >>  S:	Maintained
> > >>  F:	drivers/gpio/gpio-usbio.c
> > >>  F:	drivers/i2c/busses/i2c-usbio.c
> > >> -- 
> > >> 2.47.3
> > >>
> > >>
> > > 
> > 
> 
> -- 
> Sakari Ailus

-- 
Sakari Ailus
