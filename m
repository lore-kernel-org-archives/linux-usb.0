Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 357B1220F47;
	Wed, 11 Feb 2026 05:37:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770788265; cv=none; b=UihZBr+FRV/+BOtAql5TXorwAXZBKUDJJ64nuJv+edtfKwK57r5KMvRZSc0hg404n8N0/wOJri0i3nEsQJARfVun3tb/zTEwVz/XGidw79CWLsf+5Yjza5/xWoCBe9vfeLDirPdk4kPlGASPZYX4vIvTh5NyIdoDGAyvh2mnDJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770788265; c=relaxed/simple;
	bh=xSK+/R8ofFXR7NZ2ZTbi2YEBxHtMQaqHiHyMWPEOIUI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f3MpMcHCDxPAMHLLq2lfhntMKblF7bVlirYS9P9KL2UhmoZ65n91aUMHAm5dDkXSahXEnJZya2TnhNX6j9QAoUjzjW3Hrol/lp28wtI0gbFPtHMyjYWErZ9iEWRXeAgc2rmipWExa0XNQ75pD5XdoZmT/IgugF45aKWGSkMfg9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=UksyTyt1; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="UksyTyt1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46741C4CEF7;
	Wed, 11 Feb 2026 05:37:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1770788264;
	bh=xSK+/R8ofFXR7NZ2ZTbi2YEBxHtMQaqHiHyMWPEOIUI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UksyTyt1g5Hk6+43hHtuMWdqezs0R3RBjDwcqmlk4CQqUyuA3VUYM1QcEBKS5ecoT
	 Vb/NeJQ7qFOlNmXb1Q2pWEaUdgUvFCY6OblIRM4PdRp6ZtyyDcQ75X/IoaTK6zcEBT
	 D0LEvlNZww4zHke+LZmjWviWGjw4e1CiCqrmiKAg=
Date: Wed, 11 Feb 2026 06:37:41 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: AceLan Kao <acelan.kao@canonical.com>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Pooja Katiyar <pooja.katiyar@intel.com>,
	Abel Vesa <abel.vesa@linaro.org>,
	Andrei Kuchynski <akuchynski@chromium.org>,
	Venkat Jayaraman <venkat.jayaraman@intel.com>,
	"Christian A. Ehrhardt" <lk@c--e.de>,
	Pei Xiao <xiaopei01@kylinos.cn>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/3] usb: typec: ucsi: Detect and skip duplicate
 altmodes from buggy firmware
Message-ID: <2026021124-badly-emit-e90f@gregkh>
References: <20251224070022.4082182-1-acelan.kao@canonical.com>
 <CAMz9Wg_H0HrDHvnvKbPE7XMtBwCQ=2poeqseNW_RdoOC-DNrDw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMz9Wg_H0HrDHvnvKbPE7XMtBwCQ=2poeqseNW_RdoOC-DNrDw@mail.gmail.com>

On Wed, Feb 11, 2026 at 11:32:37AM +0800, AceLan Kao wrote:
> A gentle ping.
> Please help to review these patches, thanks.

Wait, no, we rejected this series and said "fix the firmware".

What happened to doing that?

thanks,

greg k-h
