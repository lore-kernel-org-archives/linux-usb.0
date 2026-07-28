Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DD1942CAF8;
	Tue, 28 Jul 2026 11:56:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785239768; cv=none; b=u8EYtPvTwWbImP5Zo4bgZQmPPGvxEWxl+2Y2mooY5aaxxOVDCXZwbYxzmXjZL5fXDkN1ln4toccnkij0wSvLzi771hw4rqiN4GhKS5uF/g7s0CYaKjCfgSDPUCPpq0+UHHS5poZr4TYmVEVjY85UL5AKi3nVJJwkUko3OrkyJTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785239768; c=relaxed/simple;
	bh=Qo9H18z1VoE/V77dRW0jMF2en7ULA8AKrTC0g+7XX5o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YcdTKkdhDmM54T9Zxo5JrNcTCGTrBP1uBxbinNIArDg0pvBX6EfCu/RzOMYEV3/T6QPPcVlJ1lJ7WO5unGh26UC5sLVZbyb/uo6p2G4BAcahbr88Nm3V9Sh/AIMRxU3z/PyU0X1pFcqG8NwOvaAydHURzSyDVojMPVCEsRuG5dA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CLRKNV9l; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CLRKNV9l"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785239767; x=1816775767;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Qo9H18z1VoE/V77dRW0jMF2en7ULA8AKrTC0g+7XX5o=;
  b=CLRKNV9lB2iZ5Y4lTawxHrE3iA1F50MSmrSwbdzBCoUf9U2fZjCHD3Wc
   HCd9BesS736IlQJ3YrKSLY3JrhDw6wcJ7ay+pWtyt7Vw6pCGlYuTc/mao
   p6qqrHcthDeQnxZqlBCuLwB8Zu+lNIJOIYkD8aKo8Hb3XlpC2TRIOv7WL
   HquvgBjPS75lhS9aV7deqV4lUFAH6Fz+4U5y4SPhywAR6z2ZKJrvVwQR1
   ZFFXVfthLNplfUthrymYVr6CVZxTA4Qmv93F6Y0LMqVbb4aHg/sNG4fwl
   10e5Z9clqRE8h9dwvV2c65nT0BdpbOPzm5Zapnlj8Y5p3kHMjt3YjwcD9
   Q==;
X-CSE-ConnectionGUID: pqWsOAk5Qt2ktDYWHOQD/Q==
X-CSE-MsgGUID: kSTr0iRySXa1+MEHH/ygLA==
X-IronPort-AV: E=McAfee;i="6800,10657,11858"; a="111365754"
X-IronPort-AV: E=Sophos;i="6.25,190,1779174000"; 
   d="scan'208";a="111365754"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2026 04:56:07 -0700
X-CSE-ConnectionGUID: jibquO3MQAWAroC0DLAfcw==
X-CSE-MsgGUID: OPX9G7XdQyC04MpbOLxFxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,190,1779174000"; 
   d="scan'208";a="261656859"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa004.fm.intel.com with ESMTP; 28 Jul 2026 04:56:05 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 4032699; Tue, 28 Jul 2026 13:56:04 +0200 (CEST)
Date: Tue, 28 Jul 2026 13:56:04 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Pan Chuang <panchuang@vivo.com>
Cc: Andreas Noever <andreas.noever@gmail.com>,
	Mika Westerberg <westeri@kernel.org>,
	Yehezkel Bernat <YehezkelShB@gmail.com>,
	"open list:THUNDERBOLT DRIVER" <linux-usb@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] thunderbolt: Remove redundant dev_err_probe()
Message-ID: <20260728115604.GQ2365036@black.igk.intel.com>
References: <20260728080548.389503-1-panchuang@vivo.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260728080548.389503-1-panchuang@vivo.com>

On Tue, Jul 28, 2026 at 04:05:48PM +0800, Pan Chuang wrote:
> Since commit 55b48e23f5c4 ("genirq/devres: Add error handling in
> devm_request_*_irq()"), devm_request_irq() automatically logs
> detailed error messages on failure. Remove the now-redundant
> driver-specific dev_err_probe() calls.
> 
> Signed-off-by: Pan Chuang <panchuang@vivo.com>

Applied to thunderbolt.git/next, thanks!
