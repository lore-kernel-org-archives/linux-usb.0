Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90B251C84A6;
	Fri, 26 Jun 2026 11:06:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782471984; cv=none; b=NcdjMA83MHE0dnwPDeixCVin7UQgFKsdRzL4uztdnysqJb+EmkOmIPPU2THO4FGWiyFrT3m3r7+bJXij+SMTP3aqU6wD/RRJJlOC/fMsKJM0pflrffRqjv3nXHne4jX2RkcVDxbLJXE7IXbRhpNHj4tfztCtjv3JmAlkr8M0l74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782471984; c=relaxed/simple;
	bh=gi1Vy+Mz7Gj36q29Uko6V6UeLbhAs6UX9gvo193O3zE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fg99grw7nkanOe8n+XGmxbSMeEdZEYlY051WQvH0Dbyr8dpZg6CyBjSETbEsbqBiaKzYMtP2sdpQZ/ZdAffROK80UoLp4j874u93F2GmwVQ+PIQGKhwLA143PfOmzZLpfjypuSYx2PWodogTMCCaXZhhBxuAaiLb9nfzTqfCyEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hRsTzuWw; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hRsTzuWw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782471983; x=1814007983;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=gi1Vy+Mz7Gj36q29Uko6V6UeLbhAs6UX9gvo193O3zE=;
  b=hRsTzuWwGOivDdEmTlNbEzKvOcoisgQ/XuJ8tRcjdB+8jPIdwnGFbwAN
   fIds+F44spE5SATGwcWH65R5cDSxkOu4M/y6jzE+NUTMBPLd0mMVAd2/N
   3HbU6tj0XwntZoacGmldQaH8nXh4Vi9euR0XOXeQGJETUAB0VJWGyXP/5
   dpFLVbXdScDP4X+2Kj3GMsuH+a0ERloRdICQ/XFiDn1a6Uja8qdpJUtPZ
   ddWCmdlc6TzNaseWKWVuktYk/EPBBoRjml+vDf4aM1jPOKNgAz5cE8No4
   F2j4MU/Y4kA6CSMrtFudM0FUlulI45g0AKMP+3hogSo+AEmLHhOBRM60N
   w==;
X-CSE-ConnectionGUID: 7yGR5H5rQY+jQPEkSIlqUA==
X-CSE-MsgGUID: o38Gr4gRQOKKZSamMwycrg==
X-IronPort-AV: E=McAfee;i="6800,10657,11828"; a="94749309"
X-IronPort-AV: E=Sophos;i="6.24,226,1774335600"; 
   d="scan'208";a="94749309"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2026 04:06:23 -0700
X-CSE-ConnectionGUID: J19sjrLzShiURUyNGwOEXg==
X-CSE-MsgGUID: MB52JrB0Rk6P0u0bHMEm7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,226,1774335600"; 
   d="scan'208";a="244906658"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO [10.245.244.84]) ([10.245.244.84])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2026 04:06:20 -0700
Message-ID: <47d81805-8975-488a-8632-cac09b4243bc@linux.intel.com>
Date: Fri, 26 Jun 2026 14:06:13 +0300
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] usb: xhci: report USB2 resume-exit timeout as an
 error
To: Pengpeng Hou <pengpeng@iscas.ac.cn>,
 Mathias Nyman <mathias.nyman@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260623140503.87226-1-pengpeng@iscas.ac.cn>
Content-Language: en-US
From: Mathias Nyman <mathias.nyman@linux.intel.com>
In-Reply-To: <20260623140503.87226-1-pengpeng@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/23/26 17:05, Pengpeng Hou wrote:
> xhci_handle_usb2_port_link_resume() waits for the USB2 resume exit
> completion after requesting U0. If that wait times out, it only logs a
> warning and then continues through the normal resume-done path, ending
> the port resume and marking the suspend change as completed.
> 
> Return -ETIMEDOUT on resume-exit timeout so the port status path reports
> an error instead of a successful resume. The patch still ends the
> usbcore port-resume accounting before returning. This is intended as an
> RFC patch because xHCI resume state handling is policy-sensitive.

Does this resolve some issue you are seeing?

xhci_handle_usb2_port_link_resume() is only called when xhci roothub
responds to hub driver GetPortStatus() request while port is in a xhci resume state.

Returning -ETIMEDOUT here will cause the GetPortStatus() request to complete
with -EPIPE status. This does not seem like the right choice here.

If resuming the port to U0 timed out then there was no xhci port event, and port
should still be in xhci resume state. USB2 does not have a "resume" state so
returning portstatus as USB_PORT_STAT_SUSPEND seems appropriate.

Ee should also reconsider if calling usb_hcd_end_port_resume() is right in
the timeout case.

It also looks like we accept any port event as a successful rexit_done completion.
If the event was due to a disconnect we will incorrectly still report port status
as connected , enabled and non-suspended for this usb2 device.

Thanks
Mathias

