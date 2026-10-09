Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E55BF4CC627
	for <linux-usb@vger.kernel.org>; Fri,  9 Oct 2026 11:00:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791543637; cv=none; b=UmASRseSSH8QajG1NADqWyVHw+wehmFzMwZqhD3OvAdyacScr6y4nD27B4XJkKq2/PMVMsq2rrHQhwAfynju3W6xEJupPYAE5cCz6Q6Rqo7uzjrGP0NtD/Y70tJ3XXnF+DLL3a4OV5FjxVjgQK/gaxmn+yF/SIFbTAjS9QndOfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791543637; c=relaxed/simple;
	bh=STzg7n2odK3s0/NTD+fIEkDOhVuXZlSCdF3kVC6VpOo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HHG1moHA/D3H1qR+ZX8wLlZzyoCxUHx+M43CP/CQgst/EiSeW7LZpkvagC6zG/bR4TTTGRu8xDCvyxfu/4WCm66uYokbhvorAfoLA+JLKTO74nS3PnQ5ywgA+dUu+56fBVVJpN3LzXE7Q+NH9dwi+Qr/mZ5Bzbtbj2Xhlw2Dcow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WbKm67Uu; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WbKm67Uu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791543625; x=1823079625;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=STzg7n2odK3s0/NTD+fIEkDOhVuXZlSCdF3kVC6VpOo=;
  b=WbKm67Uug0yxtU7xnyNPPRylrM9py5IIttFCX/sPzSuVuUtb1yqVpvG1
   ixeX7+lCa7t+RwPi468GvSsSgTr9zNprJp4GPqx2r5X6N0mQJyKlhICZ6
   zUdcHvKM64HirkJW1UztQi+QzM/7ftD/HIIFdWWK/zpZMaRow1b5YWpsB
   FQUIjZUfU724hs5ymV0NLQNKN9J1UeuWBMJ9hlOH1N1y9Ewz3NkeCWhi8
   ehLm89Zx1O+9ZIekUuQDoHD53eoXWWKdUzw9/ncZ/4CS1ClDyb5aO/up/
   oUIGefA1zPx46WG4VYEVUBHkVC6SvoplA5cybn94dBzL8QBF3OJneNyIP
   g==;
X-CSE-ConnectionGUID: DUDos3O1SLeM9KBFst1G2g==
X-CSE-MsgGUID: G7gHtWiRRvSpCZehOwYygw==
X-IronPort-AV: E=McAfee;i="6800,10657,11929"; a="342136"
X-IronPort-AV: E=Sophos;i="6.27,148,1787036400"; 
   d="scan'208";a="342136"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2026 04:00:24 -0700
X-CSE-ConnectionGUID: qYD61thxRmiEqhwakoUGiw==
X-CSE-MsgGUID: IRcfOiLtQViBUhmsoHdQ5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,148,1787036400"; 
   d="scan'208";a="648027"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO [10.245.244.17]) ([10.245.244.17])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2026 04:00:23 -0700
Message-ID: <b07fb226-d2df-4fe8-9a09-dccd61375ca0@linux.intel.com>
Date: Fri, 9 Oct 2026 14:00:21 +0300
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/14] xhci features and fixes for usb-next
To: Greg KH <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org
References: <20261009095834.561578-1-mathias.nyman@linux.intel.com>
 <2026100935-recreate-finer-714b@gregkh>
Content-Language: en-US
From: Mathias Nyman <mathias.nyman@linux.intel.com>
In-Reply-To: <2026100935-recreate-finer-714b@gregkh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/9/26 13:50, Greg KH wrote:
> On Fri, Oct 09, 2026 at 12:58:20PM +0300, Mathias Nyman wrote:
>> Hi Greg
>>
>> xhci improvements and non-urgent fixes for usb-next.
>>
>> One series by Michal to improve transfer event handling, otherwise
>> smaller scattered patches for dbc, early dbc, sideband and generic
>> xhci cleanups.
> 
> You you want me to take all the ones here that were "clean" from the
> sashiko review, and ignore the ones that were not, or do you want me to
> take them all now and those issues (if they are real, at least one I
> noticed is not), will be worried about later?
> 

Let me take a closer look, I'll send a new series today.

Some could be dropped, cleanup up, and submitted later, like [PATCH 1/14]

Others like [PATCH 10/14] is mid series, and don't want to blindly drop it
without checking if sashiko issue is valid

Thanks
Mathias
