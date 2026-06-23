Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28DEA35E930;
	Tue, 23 Jun 2026 12:36:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782218167; cv=none; b=RXjF1IymSJJy1s7UMmp6J6kz7uc6paS1WMhv/FsP40/w44ooj3YKJ+LUE+jNii8iiyWPpaqfiBj1ywlpJYdqpJKF1rBnuReobpUtTRFvChOZvEfOTteildU9nA1/tlcY4stj8uN/0xWjeaSWsbn+F+xuDqSc8GNYyllco04BwaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782218167; c=relaxed/simple;
	bh=UWD8Y79spTtjU3ELcw6UStvCUpIhYOMTJ0LyQBeO9ms=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ArfbimQEhlZVGHzHnu0fUWbAfSgbmmI97bjXG36Zl0fKe8yyqJJ+99hNis/vzM7uOyeM8eArog5htUF+kceQdGUM99l2h1i85jnKg9vYwAi3FQSBycGEkyQktjBh/pbnGIoViJp+2ZCscOtMhYu/rl2SqU5NLYfhbhU6gtxezhg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jurNJiv4; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jurNJiv4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782218166; x=1813754166;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=UWD8Y79spTtjU3ELcw6UStvCUpIhYOMTJ0LyQBeO9ms=;
  b=jurNJiv4DIxvZpFbfTqQCGw6I/WQ89dK6ppMbKZ5HKI2mCeWQ5QoMTvq
   y+VFnlMMLbjP6pY4YQAHehfC/B6QQUKuRYLkjfRj9Ke1hVyjkSFSAZfvU
   0i6l5PPVEiBe47hgUldRRUqRLZ3ZailuB6PCoIl1r8/ZpQNqnQ+1M4bYd
   EZkBYeTjAY33pzZwYSzrZAOsnuDEwK5qtNNx2yiB3+A2W/7b/BhCcDJwK
   qtlu8lgJLJJ9pcb7UkFL87SeasdkXQoofVHYK5jAhIyv4qBF5NDLdY7bN
   VLsTTtilGxHDP8868rNzzAkZcANJE1afXhXSs8+DKJVz90pJZ/+oC3QJu
   w==;
X-CSE-ConnectionGUID: h7PzUD2QQEeOtDBqPr7bag==
X-CSE-MsgGUID: X+g07R6jTnCAZKIlgEDLUw==
X-IronPort-AV: E=McAfee;i="6800,10657,11826"; a="94451943"
X-IronPort-AV: E=Sophos;i="6.24,220,1774335600"; 
   d="scan'208";a="94451943"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2026 05:36:06 -0700
X-CSE-ConnectionGUID: MmmyfEGDQGOZ1Ljok6/V4w==
X-CSE-MsgGUID: jDMP8g9pRnuFREOBlsnV5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,220,1774335600"; 
   d="scan'208";a="273208258"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa002.fm.intel.com with ESMTP; 23 Jun 2026 05:36:04 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 1D9E595; Tue, 23 Jun 2026 14:36:03 +0200 (CEST)
Date: Tue, 23 Jun 2026 14:36:03 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Pengpeng Hou <pengpeng@iscas.ac.cn>
Cc: Andreas Noever <andreas.noever@gmail.com>,
	Mika Westerberg <westeri@kernel.org>,
	Yehezkel Bernat <YehezkelShB@gmail.com>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH] thunderbolt: icm: report switch runtime resume
 timeout
Message-ID: <20260623123603.GE3066@black.igk.intel.com>
References: <20260623061811.62475-1-pengpeng@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260623061811.62475-1-pengpeng@iscas.ac.cn>

Hi,

On Tue, Jun 23, 2026 at 02:18:11PM +0800, Pengpeng Hou wrote:
> icm_runtime_resume_switch() waits for firmware to signal switch runtime-
> resume completion. If the wait expires, it only prints a debug message
> and still returns success to the runtime PM path.

IIRC that's intentional. Otherwise it would have logged it as warn or so.
This can happen if the device is removed while we were runtime suspended.

Do you see any problem with this?
