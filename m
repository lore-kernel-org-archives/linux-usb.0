Received: from mail-qv2-f40.google.com (mail-qv2-f40.google.com [74.125.230.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD94DDF72
	for <linux-usb@vger.kernel.org>; Mon,  5 Oct 2026 04:01:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791172885; cv=none; b=rnDDZ3m1mmkONsdj4ktInh3oTMc5oLtaUTaeVkGnsqcE5CVSXa5g61QbR/WB+rs5ZioY+eYmlPzLNfx8y24f1PimCmMt/NsjTsu/lbYYkdZCkbEEc4iPJ0hMkAx/z5Wgb0zhAjxDoMr3prHnFQq7XRN9dgbDU2ESwH2yE9DzZ7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791172885; c=relaxed/simple;
	bh=s6RTd87ejHnpper2/RZR8zUsmJByUU/0oBapURZQmy4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cFwL+iUm0qmSH078fuAC7wVfjmFifxBkRy8o9QPuxcKFsstuenyDd82TV+dLwN1zXCKEZlCuDWy1lg2g8KtShmYJbRg9sfxY7Q0mH+pOr1x18IBc3xPHIQ7292Lj0RL+45S3byWIhLYe0rqycS3z95hskpC0+TLB4XewcUohfH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XYwL6taq; arc=none smtp.client-ip=74.125.230.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XYwL6taq"
Received: by mail-qv2-f40.google.com with SMTP id 6a1803df08f44-917a8bbbbf7so8638326d6.1
        for <linux-usb@vger.kernel.org>; Sun, 04 Oct 2026 21:01:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791172882; x=1791777682; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TqrTtOgz71bOwQTMjtxUUo0BC1fH58wEyMEb4MWuhU0=;
        b=XYwL6taqZ/Rb4F5K8W9HNpeGzUGimVq408Sl/5JB2JsmLq+M3yh+98myDQ3h+ZxS/i
         AdXPrmVrLxqjqPm+lRGgoREoL2r7/Fz6wksdOx5t1G1cpnAVFyv5AHUFkfyHnLXTC+lG
         P8qlcr/VP3mfsE25W8/QW9D4E1HeJ1lekFYlsUwQyeCx4qSfucOC2avszwTyElpBJZQ5
         98G+LqpaGLgHpTgssVAMyqt3dwtgMzcA74CGtQGLsnn8mm8uC3JPNTMriReScKC2Cuyh
         p8QNEfDCJl0nb0fc/H/YyD3PszSuKqMbbWg9JRMgVUKv3C+Pez4RBjWszBS2h75lxnUK
         r1Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791172882; x=1791777682;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TqrTtOgz71bOwQTMjtxUUo0BC1fH58wEyMEb4MWuhU0=;
        b=FxyuhhSrCNu8Y+RKjJt9cHrHx1hW3EU8RZT7P8D3uwpSH2wXD7Pk0DtnRGm57Olm7C
         7Q0utjcmwGgX5gwJYMvcZ4y3mkDRL5JGUe+LecBoVMP41BH3DNT6uWiikJkdec4//fi0
         rZc8PHsZw8IbMq6mAV7PYmSGChkYMk50OjRZzqOQJsUdetlZsHM1hDCvAch4MmfHGg9p
         wltpLzQHW2nMIt9ke8Vs2CVH1eITTx6e6jvgKO0bKONaeXBtCTEu25Ps6Ptrg15hNeyk
         2rxF0hB0vgRM5ZEFbTy0LH03wauzEFPNGZXJS9uClgaXx/dpNG9PdogjjMbLucTXq248
         PuAA==
X-Forwarded-Encrypted: i=1; AKwUvBy6I48pY3g8opF7A9XrM9GxoQ6Cf/DkxPqFu/l/bRIzni26eV511WIUer1jKCM4Fm2pBv6JYokj2rk=@vger.kernel.org
X-Gm-Message-State: AFq9FYLom31BaxsUYMC+rssIdopw1jIl2eDy/o27zdTVcyFBOyy+0682
	6couC2PxfUBAzgehgf95uKa+Wdz9D8IHCc2l7XzGlaH/wZRB9xJQFCVF
X-Gm-Gg: AYBFou14+5x4BOXhjGUCUPnXsPWC6fF9HDWuJxzRwIHPTL4I4HbDqfBPN4UaD1tWfrT
	RwR9kZ/vojaYFkm+xVv2M4vp0+jWgzQ+WtoPfON8chta+VECJ35eFgYQLiVQ8kDhRcb0FWxlwA8
	kPM4+gQYrgUEg0fHc0vGonAsRMsUZfm3fjBq93NNrtIF4WNS1g0cexBNuVymfvuzJPWmJcgDsZe
	dCWuGyZWYGEezQ6jQ+WI0s/zk2kLAKUky3AFBwnc2uprjaOSfnG1TXn8nyJ21tYziP7PClGN9EA
	Bdy9hDqjJ2yC7YrWqZh26AK3C+gj28L3a4NN2CMH9YaxT0BdRGonEb3N/+y+kr6fH+20ipASFiL
	8iImYcGCNDnyd3fWnbNh72R/i3zmnfsZPjc8SvtdKZWYkVNnl08uhYp5XYHKM8wrgwelmRnHcw5
	/JCLXpQVkmrPbIH4RRtXAS0BDtsjA0KVUr6LnyyKwpLeY3nDKDDO+KzKsfSRu9cg1uaNy9TLiY4
	+3+xNqqFATR0e69p1cT+lIhQMHlTQ==
X-Received: by 2002:a05:6214:5196:b0:90c:c1eb:ae42 with SMTP id 6a1803df08f44-917c00de4c6mr180429206d6.13.1791172882520;
        Sun, 04 Oct 2026 21:01:22 -0700 (PDT)
Received: from dhoja (S01067483c248479d.wp.shawcable.net. [50.72.244.202])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-917e0c43c47sm77948746d6.48.2026.10.04.21.01.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 21:01:21 -0700 (PDT)
Date: Sun, 4 Oct 2026 23:01:19 -0500
From: Curtis Vogt <curtis.vogt@gmail.com>
To: Mario Limonciello <mario.limonciello@amd.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	Michal Pecio <michal.pecio@gmail.com>
Subject: Re: [PATCH] USB: quirks: Ignore wakeup from the Valve Index HMD hub
Message-ID: <asMhD7WvhIk6DjIc@dhoja>
References: <20260924034200.421686-1-curtis.vogt@gmail.com>
 <a2f981e4-ac6a-4d1f-8c5c-bf529e0a16e2@amd.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a2f981e4-ac6a-4d1f-8c5c-bf529e0a16e2@amd.com>

On Thu, Sep 24, 2026 at 10:44:18AM -0500, Mario Limonciello wrote:
> 
> I guess this would make sense:
> 
> Closes: https://gitlab.freedesktop.org/drm/amd/-/work_items/4333

I agree that the issue can now be closed. The source of the "bad state"
was ddcutil which fixed https://github.com/rockowitz/ddcutil/pull/637
which was included in version 3.0.2.
