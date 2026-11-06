Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793987438;
	b=EM2vRShJyx+KsthPJoSf3yYgWzKm1kizVdJRYZZPTvxt/w/awWNbWnaRqoIgnrcm5J3w
	 04zsKB0ExY58aLAsZoUyoVO+wP1c1ZzlINgr/KIYi2rEbanfbjpZO/777jWu6PNPs2t9Q
	 MqXKXhwvKrTkRGlSV0+5TRvBIZR6Pd+F3D1zXFhgGSFE1Nq0A2ff4fu3VeVY0SJk2/4Us
	 TVL3LnGc7UwAFy6NBMGCI+65WZ97TIfz5ydU3LW4JcKCmF2CT30v+w8QmLbgHhN8uknd8
	 77rPpuke+DHJl0NIu9U93KwlmPyyOvkF0RlVKyL13Ky9z0xkn/5Wahe0VGWQylgA9Yw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793987438;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=Aie1AGf/1sIkWhWNClMfvNbv/EL71yTDZE1Krt5CTqg=;
	b=o+/E1BodScnYAbWiBh8V3aBRsTdVHambfxq0N8YxGxrheFpgGxEkMC78MW68RZxIF+BJ
	 gaHu6tbqHt6Y5BKbUeEcxD2xSgltqvtHLilFBmGkOP0o9YVtkuUq4+tZBdyuV+qQYOdAt
	 wc8S+ca/j+suSIG3kesXmaxu3gPnIJNn6lwFp/Yo39t4ILUOQnsOb7/OCUDLOVEeZMbAp
	 Q3C14cO4xKPK3X8KujWEJToxSr9+3yl9RaEGhaRJ1jso3G+Enp6pokMyxCRCIhcMEERC7
	 Bh2OUHBI2DLeBdwgpyJSAmAiH1c/oBmSKNHIZnY5gITB44wBfnYQSfAkJoZUoLE8Z4A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=UXdj8Yqk;
	arc=none smtp.remote-ip=198.175.65.18
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65E78606A329
	for <linux-usb@vger.kernel.org>; Fri,  6 Nov 2026 17:50:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 65E78606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=UXdj8Yqk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793987439; x=1825523439;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=oNlwsbfRGsmml4RqdQ4sJ8dhGzJ5PUBSuc3IzvJPnZk=;
  b=UXdj8YqkOjwLkivb6CsW0pwwK31PJgvnNRdCEHrRxtcPYrLHpxkxETq+
   m4tymKa3Q91te59EFXlZs6YwNNgQo7VSeoEWY0G7PIhEOtGTUiH2XrjM6
   Il8C04GqBE0e4nJrJtgXJQXx9PUGWK2Wz9UCX906rusOC65xCae9xYCEj
   dW4xVbn3obgijzNIu6M1b2ts9LVPLBH9MuJOBjpVFNleTXQ0HJto5qqAC
   QZJNfivgzD5AtbiUwEm0N4CkNZ2xFVqKkKFthvA/REWOnVna4D+lGy+eQ
   DzAmT9Wr/Mljt2JXkFgQq53Wk29XxYuL54beZUF58LbmQ4A/pa2FL4h/s
   A==;
X-CSE-ConnectionGUID: 0X4iJQOMRzG+LVn+gLgwdg==
X-CSE-MsgGUID: qn39Z86zQqWmORU7+Uyyjg==
X-IronPort-AV: E=McAfee;i="6800,10657,11958"; a="2819818"
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="2819818"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2026 09:50:39 -0800
X-CSE-ConnectionGUID: jufPvEFjQweJq6XGQxdgCA==
X-CSE-MsgGUID: fYRTaQ3QRXy/Mvaagd5qMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="7224184"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa005.jf.intel.com with ESMTP; 06 Nov 2026 09:50:37 -0800
Received: by black.igk.intel.com (Postfix, from userid 1008)
	id 3F32399; Fri, 06 Nov 2026 18:50:36 +0100 (CET)
Date: Fri, 6 Nov 2026 18:50:36 +0100
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Peter Walker <peter.walker78@gmail.com>
Cc: linux-usb@vger.kernel.org
Subject: Re: ucsi_acpi: "bogus connector number in CCI: 2" flood on Acer
 Aspire A14-61M
Message-ID: <au4TbIvSBLxIWxnQ@black.igk.intel.com>
References: <CAPv=dGA4maJEzJ1mt6udD71WFD8SbxGFfun5Hg8PpvGEb038HA@mail.gmail.com>
 <ausGNtWlRzZN29ux@black.igk.intel.com>
 <CAPv=dGA6ygdQ8StHwht6nPJZyb2FTH0n03txOOWhb4SSHkG9zw@mail.gmail.com>
 <CAPv=dGBgnxKoyOrcbKBwym5sm3M9+oO+L5R1do7pP9X6cBDXUg@mail.gmail.com>
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
In-Reply-To: <CAPv=dGBgnxKoyOrcbKBwym5sm3M9+oO+L5R1do7pP9X6cBDXUg@mail.gmail.com>

On Wed, Nov 04, 2026 at 11:28:12AM +0100, Peter Walker wrote:
> I don't have the laptop with me at the moment, I can run the command you
> provided this weekend if that helps?

It would help.

Please try to avoid top-posting on the mailing list.

Thanks,

-- 
heikki
