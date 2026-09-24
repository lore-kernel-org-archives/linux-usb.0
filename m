Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45745184A
	for <linux-usb@vger.kernel.org>; Thu, 24 Sep 2026 04:43:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790224986; cv=none; b=JNXldhfJvR/bW80YXr/EZI9CzlYg0yz8AC5u2iWy7Lg+nthxgaQNYowYePKYgzud3tORgXJeiuSLF0RTF0yD0yChTnkJ/6yajVUndR03oQ5SiOwr3SFR5mIvl2lsvJnBu06U1N+LWdkZ+7L5Wpl3ov/UH2RTpY45F6d5pJcB9aY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790224986; c=relaxed/simple;
	bh=ZXIGaT4caUzEnYgwxdkGh6Z4fXE5RRPTjDKC3DPLEEE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EwNIvN4YShgQnRCLkFsEY3hbRCalo9ZTuJjoB/lcWpGXuxBBM6oLjlTygjdP6gZqiV9BMSi+J9DLe72p7VWrtal7AJCseBMTlHpypSjjT4So9nT9B/cTW5bbpVkf8uwdYD7bTelr1/OnY7p2IKfPVqLFi7ye9tRtXTrtRQxeAQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nTCD40NB; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nTCD40NB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790224984; x=1821760984;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ZXIGaT4caUzEnYgwxdkGh6Z4fXE5RRPTjDKC3DPLEEE=;
  b=nTCD40NBWZrn+Ra4J2mEFzsT30UfhnPC6Kvp0+BhGmUOpQ5CkVmirxX+
   coaEWgSwsXzwZsYtG+emx0h0aZD3A2YhOWpA1Pj6xVL18NixCdwR+zDY3
   JnJrsM6NevDvB4D0qzWrkLmjMcUjBySfCQ3eVilQeVgEfQA8FRf9gtMI8
   KdZYDBkP97BErMaNxHTHz+P8dO5YGw+LbO8xFZCktb9jQglW4FpQ/5P8N
   Mf/3E9gRkUKdHi8YlCVebKzf/rN7w/OpdQMn340Ym/0qPupwmWUxjTDfK
   N1swKbhUy1oefIBxoGhjHSEBETMwtyA4JnY/BLtBPr1Zhc+Oq3vGlc1Cm
   w==;
X-CSE-ConnectionGUID: ysSidS9BT0GUUGdGSeeU1w==
X-CSE-MsgGUID: EDRMpKelQh+X9Fn2fkPrqg==
X-IronPort-AV: E=McAfee;i="6800,10657,11914"; a="107370523"
X-IronPort-AV: E=Sophos;i="6.27,119,1787036400"; 
   d="scan'208";a="107370523"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2026 21:43:03 -0700
X-CSE-ConnectionGUID: aHrX4ifJRH2gD7rUuVjZgg==
X-CSE-MsgGUID: FIG/00ogThy4THEcmuJUmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,119,1787036400"; 
   d="scan'208";a="272510665"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa006.fm.intel.com with ESMTP; 23 Sep 2026 21:43:02 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 9E94599; Thu, 24 Sep 2026 06:43:01 +0200 (CEST)
Date: Thu, 24 Sep 2026 06:43:01 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: linux-usb@vger.kernel.org
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>, Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>
Subject: Re: [PATCH] thunderbolt: stream: Improve CLOSE handling on write side
Message-ID: <20260924044301.GJ106095@black.igk.intel.com>
References: <20260917083751.1016703-1-mika.westerberg@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260917083751.1016703-1-mika.westerberg@linux.intel.com>

On Thu, Sep 17, 2026 at 10:37:51AM +0200, Mika Westerberg wrote:
> If there is only a writer in the stream (i.e the other side just reads
> and this side just writes) then if the other side is closed the CLOSE
> packet does is never picked up from the writers RX ring because we do
> not complete the RX poll. Currently we do that only when something is
> actually reading the stream.
> 
> To make this work on write-only stream, complete the RX poll also during
> ->write_iter(), and then make the stream return -EPIPE to the writer.
> 
> While there make sdev->closed to use READ/WRITE_ONCE() analogous to
> other flags.
> 
> Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>

Applied to thunderbolt.git/next.
