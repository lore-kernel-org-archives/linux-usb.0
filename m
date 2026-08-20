Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0A0A442377;
	Thu, 20 Aug 2026 12:34:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787229267; cv=none; b=RAGSrNZS0HygoDM923cc2dwpJNSRe4Tg1Xk5PIF0TkPyMdk+Gvxl0h0IPLunvnpBDvMx2F+pDHAjAjqhYg0ZN/4WuE/BC+y3nfho7rtLAyxHpkDxvL4cJI5HzdacwBNIvARZbhyFIaZv/dh/kq3NhRGpvmWLJXQh1hJJLug6/48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787229267; c=relaxed/simple;
	bh=eQhmM6+zCcssH/QJBxVYwugA4kaa2vmIHaN1avXCkkA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bv8JC3Wr9rRH+ZiAXrK9Df6B8m6pDiZn7AAEGTScqy21vphmrYJTuH+UH6405QzK/SGNRPkejxzmHYm97cgmeV+1fR+ZS53dpqI2xND3FFyxeHGVNsYie/W2MRhdlLAXfsvcdokrb0gjjIhH7BxBA9mibzi1yWR/Tbn5e1Ffv00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JJvUlYH0; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JJvUlYH0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787229266; x=1818765266;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=eQhmM6+zCcssH/QJBxVYwugA4kaa2vmIHaN1avXCkkA=;
  b=JJvUlYH0gJ6ashw5fTVSxHFPFR37vVrnU18ZZW+fzPyLXnAaIPU8owiB
   xt6wpGtsnC2iOvCb+6vaKOAuA7XTo660MtQVCbkNSN0Msq+EFHC165jfy
   AlaV8VnWkR9aUWsWWLFGTrphOjW17g8UzU8vhg5CWbuGPNNaUNFz8S1iM
   YxfE9fNmQwk86fI6qpTnfZ8ULyxaTPAI1crowPLmSkpGhKa2RDChbwUYY
   TUfTvLU99fqesYOKyy4fK/XIVZdaYZp3lq64sS1mUJ8xPtMBcg7bfFk89
   cNLzv4nxTfwUuV4ixAY6kXAFj2JHkVxSKmyydCZV9ymnzGgs1Sg/dXSi8
   w==;
X-CSE-ConnectionGUID: fDP5rnftT5yTQ5juQDruiw==
X-CSE-MsgGUID: DUbHWw+/T5Gb7YIwbLqwEQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11880"; a="99283670"
X-IronPort-AV: E=Sophos;i="6.25,233,1779174000"; 
   d="scan'208";a="99283670"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2026 05:34:25 -0700
X-CSE-ConnectionGUID: Bm8LPRSmT7eIRN96/1KWHQ==
X-CSE-MsgGUID: /hLB89BxTS2fx2/3+ZQ29g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,233,1779174000"; 
   d="scan'208";a="263365333"
Received: from amilburn-desk.amilburn-desk (HELO [10.245.245.28]) ([10.245.245.28])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2026 05:34:23 -0700
Message-ID: <7e6648ad-7459-4248-8c6c-227cfc2586d8@linux.intel.com>
Date: Thu, 20 Aug 2026 15:34:21 +0300
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usb: xhci: Fix HCS_ERST_MAX conversion
To: Chen-Yu Tsai <wenst@chromium.org>, Mathias Nyman
 <mathias.nyman@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 Niklas Neronin <niklas.neronin@linux.intel.com>
References: <20260820095714.1865096-1-wenst@chromium.org>
Content-Language: en-US
From: Mathias Nyman <mathias.nyman@linux.intel.com>
In-Reply-To: <20260820095714.1865096-1-wenst@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/20/26 12:57, Chen-Yu Tsai wrote:
> This partially reverts commit 6d45e9556d4a11b726e897d86e095b96db4550d8.
> 
> HCS_ERST_MAX holds power of 2 value for maximum number of segments.
> In the culprit commit, this was incorrectly converted to "shift up 2".
> On hardware where this field is zero, this results in xhci_alloc_erst()
> calling dma_alloc_coherent() with size = 0, leading to a horrible splat
> and non-usable XHCI.
> 
> Revert the shift-up-2 to the BIT() macro.
> 
> Fixes: 6d45e9556d4a ("usb: xhci: standardize multi bit-field macros")
> Cc: Niklas Neronin <niklas.neronin@linux.intel.com>
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> ---

Thanks

Adding to queue, will submit after rc1

-Mathias
