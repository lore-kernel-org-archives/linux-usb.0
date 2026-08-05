Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AEB933F5B3;
	Wed,  5 Aug 2026 17:21:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785950485; cv=none; b=hb/gNm97xDRHxYLhzto9KwKL+oCz5HbUNcYRXFUjsia9fDbJDeS8L6qvdZbreWqiT/Grl09838m/PS/oaI3pPXed/KKCpczuq+XwRZaAd+aW/tYHQKlVuXhi5AmYIyEOIKZ/Bcm9JvKk4zmPiJeRI/3XVRUtnofDbNoy89ExDlA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785950485; c=relaxed/simple;
	bh=68xuvlI2rnD5vJd/1iJ3dW2VvOdhIbbHPDv6ef9ZUa4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=a8i4CmZe3kCNtlFxWTMc5VMhPifydlIezcYVhcZZRPabvsnTwI2ehav9Uu4rOxTwR7s1i2wt/o8Zr/ywdMMkkp/WX4vZQp2vehqeZi1kpGR1529JO92MU6o5HX3ZChUMG06ai4goeW7kQL0T1cp/NEsIB27H5Vq/StL2t7fSJq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nHksBxHs; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nHksBxHs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785950485; x=1817486485;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=68xuvlI2rnD5vJd/1iJ3dW2VvOdhIbbHPDv6ef9ZUa4=;
  b=nHksBxHs5frWlpkN2W+qQFW0rrUI1fzsiDM7K2NED1Dt3pjelcLbJHKo
   Z00fevfBk11l+T6j7Js3mr0MVLJR1teJxJkaAQVSQ+JW9s18rXVOBGdyR
   8frQmWw6X0DK6fqY6BERTMQ/EdqJ6G4tAVhnKE+oQWmPIL43wu//qI5uK
   phVkgf8hcz9x6RtWMDf7FY5x+Tf402dEzXRMBDnlhLtvQP5OhpLVVKx3M
   A2t1adzdFxMNEzjsFu6gLrmydQuwy8SmOnkEddGgSMObQ51OfzSsl0QCe
   5eiJOSc/hmTt9ch3tF+MqYivJmsndiCu8LH4Ye9ohPnpv5ZwPmVHod/7e
   A==;
X-CSE-ConnectionGUID: v+F/Hpo8Tj65NIQfNYXwMQ==
X-CSE-MsgGUID: e+Vjch6cT5q9EFgP6nq/zg==
X-IronPort-AV: E=McAfee;i="6800,10657,11866"; a="86737691"
X-IronPort-AV: E=Sophos;i="6.25,206,1779174000"; 
   d="scan'208";a="86737691"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Aug 2026 10:21:23 -0700
X-CSE-ConnectionGUID: 4CPZF/ODTruuD9V7JGBGFw==
X-CSE-MsgGUID: SJ0xwcpJQhuApYzMmNpoLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,206,1779174000"; 
   d="scan'208";a="266997245"
Received: from conormcd-mobl2.ger.corp.intel.com (HELO [10.245.244.51]) ([10.245.244.51])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Aug 2026 10:14:33 -0700
Message-ID: <0389d831-5fdc-4e22-bf52-73eb4070bcb7@linux.intel.com>
Date: Wed, 5 Aug 2026 20:14:31 +0300
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] usb: xhci: Shorten the TD skipping loop
To: Michal Pecio <michal.pecio@gmail.com>,
 Mathias Nyman <mathias.nyman@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Bart Nagel <bart@tremby.net>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260804120110.01bda0e2.michal.pecio@gmail.com>
 <20260804120436.0832eea2.michal.pecio@gmail.com>
Content-Language: en-US
From: Mathias Nyman <mathias.nyman@linux.intel.com>
In-Reply-To: <20260804120436.0832eea2.michal.pecio@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/4/26 13:04, Michal Pecio wrote:
> Half of this loop is code which only executes once to deal with cases
> where no TD matches the event and then it returns. This code needs not
> to be in any kind of loop, so get it out.
> 
> Optimize conditionals remaining in the loop body.
> 
> Signed-off-by: Michal Pecio <michal.pecio@gmail.com>

Much needed refactoring

Thanks
-Mathias

