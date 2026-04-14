Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49ABB3C1414
	for <linux-usb@vger.kernel.org>; Tue, 14 Apr 2026 09:29:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776158989; cv=none; b=HuRL50kRYj32fozbMuVM8YZp+fllgVRT0Jr5C5pO9EaTTdTfFOIm/Y5cCXkFQLrda1ftykE1i6XZUqOD6FgI2uv5ZqtTvNVXHQzlQ7YvoXUulYGqxaFL3QcGE5GSWhjWRYT6p//kDoUCYsM5qEbHg71I1FqhmODAleLDjxa/IqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776158989; c=relaxed/simple;
	bh=cFMHvVGu35HoJnxwKFYaT/dW1De2AVR3Fx13SQ8iGnM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nCDjB31CkpJGSoplIntOVmNoaN8QZtlJ4cbAdroMLge+5EqDjvHQNC4sm/1lqMA5ojIbRjwDopw9r2NE2fC8V4lv88loR7IR95chR2Uo70u/JIjHHmD7KUcz3EUH/P2Gd+3GhqRRtMaVxDlNEjgQnXA+mrkwJ4PNWkqtH7egnfQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=J+MRR3vc; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="J+MRR3vc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776158987; x=1807694987;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=cFMHvVGu35HoJnxwKFYaT/dW1De2AVR3Fx13SQ8iGnM=;
  b=J+MRR3vcfPxJxotbcxtpGYa9jHo9kKrdOO3gEMkmGxGJzBlEuspaRiyF
   udwWNEEqWBE1M9W1RZ5c8tLNkw3EdrhNgFyg/nPfUU8EEVU9tZx1N9Dek
   ZMarejWepWWu9WeZ80B85xCBRdl2bS1PURHB2k1F4rfLjmvH87hJ4TKRX
   zrQLeTDXqCkN1dMhnLYxqY/oIM4Nl7hPk3JFrMa68iesgenOlfGHL+21n
   bLoVtZ1EsPt5TnA62gfTGq2y1AE6I34FyK6PdDmR6TcBrYaHMXdX2G41T
   fVDULygPXC9j7rSZHHGTrgXlZdiCdMOssOOd0F2TgJxqXPuHHPnB6qhn9
   A==;
X-CSE-ConnectionGUID: q/S9Sgo/SbiUH4mNTIQwjg==
X-CSE-MsgGUID: 2ZnjqV/JTzebrq/pns2b/A==
X-IronPort-AV: E=McAfee;i="6800,10657,11758"; a="64645774"
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; 
   d="scan'208";a="64645774"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2026 02:29:47 -0700
X-CSE-ConnectionGUID: Kz5vHMTaSMCvNAu5UQ8NYg==
X-CSE-MsgGUID: knHDKmo9RpmwxenaaRL8ew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; 
   d="scan'208";a="235006526"
Received: from wtcline-desk20.amr.corp.intel.com (HELO [10.245.245.169]) ([10.245.245.169])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2026 02:29:45 -0700
Message-ID: <d51b8c81-9af3-4764-be53-c45c2733406f@linux.intel.com>
Date: Tue, 14 Apr 2026 12:29:42 +0300
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Question on follow-up work for secondary interrupters
To: raoxu <raoxu@uniontech.com>
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
 Niklas Neronin <niklas.neronin@linux.intel.com>
References: <20260402131342.2628648-1-mathias.nyman@linux.intel.com>
 <47A8A9A0842FA2D5+20260411144133.1207478-1-raoxu@uniontech.com>
Content-Language: en-US
From: Mathias Nyman <mathias.nyman@linux.intel.com>
In-Reply-To: <47A8A9A0842FA2D5+20260411144133.1207478-1-raoxu@uniontech.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi

On 4/11/26 17:41, raoxu wrote:
> Hi Mathias,
> 
> I saw your recent xHCI refactoring series for usb-next.
> 
> In your earlier reply to my patch, you mentioned that after this
> refactoring it should be possible to use the secondary interrupter
> itself as the request_irq() data, instead of adding a separate
> array/context.
> 
> Would you say the code is now in a good state for me to continue the
> secondary interrupter work on top of it?

In general yes.
There are some small opens still regarding free_irq() that need attention.

The real benefit versus the regression risk of adding several xHC interrupts and
spreading them over several CPUs as the default xhci driver behavior is still open,
especially after the v11 patchseries [1] discussion.

1. https://lore.kernel.org/linux-usb/7F2D19446AC21BD0+20260202132936.2660641-1-raoxu@uniontech.com/

Can you share if there are some other specific use cases or other reason for this work?
With good justification we could add this support but limit it to those cases.

I'm myslef mostly interested in proper secondary interrupter support as enabling work
for xHCI VTIO and virtualization support

Thanks
Mathias


