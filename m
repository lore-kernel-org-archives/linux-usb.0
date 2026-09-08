Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 518A2509EF9
	for <linux-usb@vger.kernel.org>; Tue,  8 Sep 2026 10:22:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788862958; cv=none; b=QZbvNEuWhGHw8nciseEtjrQYoG6v1Oje2jGrghmqK4VlgH04ZGUZBisPNiepwMmXuSTyFEkg9zIKinHB9UU11d9DJCH0zkoRb5zDVsx4H0/BECPb5IGnx3EyCJcW6tisszie+XoROmQGb191m8l0IiPRH1KurlmEBOW1UeOzZHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788862958; c=relaxed/simple;
	bh=JjqUPM+KddRXut/gO4vJpT3B2HmptKVO+hctHxJcdZE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SNor6kFcuF96Lkel8MzalwC5YppdlwyxIoVo5mO7Mx5NMC3SjJBFjfJazAr/G63e/N0EfwYewtRTe7K2Lc6CSXFVnKNAnGw/O3JetxpkVNABx1JpY1dT2C73tfFV+H/nQHhwPkILzccFdx+Y5kVUdCMzpEPXHvl0fX3Za03FwF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nNypJqRW; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nNypJqRW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788862957; x=1820398957;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=JjqUPM+KddRXut/gO4vJpT3B2HmptKVO+hctHxJcdZE=;
  b=nNypJqRWrHb2acxvCA6u6+P4JDNcjnbFEey5PhMizSsYIbKr6jhwOgi9
   LXdJh2Jrsw/7GpKaZBteyYjuv2Pxj2ci8yH4U2KuGQjs/+QKaGHwB/hMJ
   voEPk8uY51GV+EhEtW447/61aRf0ZKCmmMArBtvGT8Ch6wHt5Ay2Ch0DK
   M140ahlwWbY1aihEqQZMl4/oabsihxmvWd3oOEYWs36XbnYWWzXMbH0dl
   HFzIBYHdFt+ik036GyLqWPJFIAlGa7e4JYt/sSDt2ssgABNUpG0UMnmcp
   QujkJAlxftlMrtXiOdT2X4lSxj1/BPgjau4IqzwvXpkGbziDrr5CbKnRW
   g==;
X-CSE-ConnectionGUID: cE/1/BGISjiWqKkUKiRO0Q==
X-CSE-MsgGUID: fW9wQFuXRzmB/HNqHwnKGA==
X-IronPort-AV: E=McAfee;i="6800,10657,11899"; a="89278545"
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; 
   d="scan'208";a="89278545"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2026 03:22:36 -0700
X-CSE-ConnectionGUID: LWj2Z6ZMSdCzSH5zbUTxRA==
X-CSE-MsgGUID: iCpYvRpeTGSLrP3qSJDaGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; 
   d="scan'208";a="269628840"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa010.jf.intel.com with ESMTP; 08 Sep 2026 03:22:35 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 1ED6899; Tue, 08 Sep 2026 12:22:33 +0200 (CEST)
Date: Tue, 8 Sep 2026 12:22:33 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>
Cc: YehezkelShB@gmail.com, alexander.fischer@kait2en.org,
	andre@negmaster.com, andreas.noever@gmail.com,
	linux-usb@vger.kernel.org, lukas@wunner.de
Subject: Re: [PATCH v10 0/3] thunderbolt: Add device links for Apple T2
Message-ID: <20260908102233.GG106095@black.igk.intel.com>
References: <20260908080711.GZ106095@black.igk.intel.com>
 <20260908094938.1175-1-atharvatiwarilinuxdev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260908094938.1175-1-atharvatiwarilinuxdev@gmail.com>

On Tue, Sep 08, 2026 at 05:49:38AM -0400, Atharva Tiwari wrote:
> > Appled these to thunderbolt.git/next. I did not get any reports whether
> > this still works on the Apple T2 system but I guess silence means "no
> > issues" ;-) Let me know if that's not the case.
> 
> Sorry for the silence, but yes the code is working perfectly fine.

Okay thanks for letting me know!
