Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A188A366DC0;
	Wed, 18 Mar 2026 07:03:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773817412; cv=none; b=FN2kfEv3vwXT5DsmB5U3TgTE/z/VXk8hYawBcXP/gHd1aSwcG/2hEYJOaesUJ5FkQaRZcO3GRs2cJC2Pb7dGwvdB6i3P8wfAjTfYWM+6On71YVdzKIx1ZMutGhij0MhfJ9BtxmmdpCSfDMAVNT8ChTBSP9dooN42qi/5jJH9kYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773817412; c=relaxed/simple;
	bh=gRHdCWV8tqoJUtCV3OMyo7dNo4HVb79QhQvB6N0dZgc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VL3T1ef7wRKrcdGovf+VHPx++Ov4Bmfmk4fIiLdqdVkuJK2Q7F2fEQqzJia0gVWDXjfavdzPOlepe7exSMTIf5CzmSO19KBQi+n5LXmNTYH00GbizDVGToXzvjxj7O9aKTc7fa8U3CqUISIHClRg3ZQXFhBw5rma1jzUbIlK7GQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ts/QV93o; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ts/QV93o"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF03CC19421;
	Wed, 18 Mar 2026 07:03:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773817412;
	bh=gRHdCWV8tqoJUtCV3OMyo7dNo4HVb79QhQvB6N0dZgc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ts/QV93oq1lwlrBL/llm41nF8LNVDG8wHZMQluFG5Sh12SqdO250RCteIrxoZMhDD
	 jjfu1tTAZ4PtyE1MstdXCOKLbKWEB//tuPrHdpYo/e/Ogcl6LDC3MMaQfRTrX/6DVB
	 UPqL9SC7GT3iCa0QKgYY5qbF3GKNPAR6sTQ5CDCpVnrnttEKAYZz2U3tLQEKM4d1BJ
	 bGgQRF/l9ywd6CUUqSSKDtn6ORZx72gYULpO2oU+7Vt4rPn5bIHuxEX+f7/XswzvkA
	 BmWeQJqmO5OJOrvqEhHRSqlOqkil2Xnblq+TzDMLHE4o9AfDaxBT/njtSFJ8b6j+Q+
	 o08CXvwG9wz0Q==
Date: Wed, 18 Mar 2026 08:03:29 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Swati Agarwal <swati.agarwal@oss.qualcomm.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Icenowy Zheng <uwu@icenowy.me>, 
	Matthias Kaehlcke <mka@chromium.org>, Mike Looijmans <mike.looijmans@topic.nl>, 
	Pin-yen Lin <treapking@chromium.org>, Chaoyi Chen <chaoyi.chen@rock-chips.com>, 
	J =?utf-8?Q?=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>, Jens Glathe <jens.glathe@oldschoolsolutions.biz>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v6 0/4] Enable secondary USB controller in host mode
Message-ID: <20260318-neon-vigorous-prawn-dce7f3@quoll>
References: <20260318040644.3591478-1-swati.agarwal@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260318040644.3591478-1-swati.agarwal@oss.qualcomm.com>

On Wed, Mar 18, 2026 at 09:36:40AM +0530, Swati Agarwal wrote:
> Enable secondary USB controller in host mode.
> 
> This patch depends on:
> https://lore.kernel.org/all/20260306091355.1178333-1-swati.agarwal@oss.qualcomm.com/

Honestly? No. Drivers cannot depend on DTS.

Also, combining here USB is a no-go. Do not combine independent
patchsets into one patchset.

I also do not see how you addressed my comments from previous version.
You never bothered to respond and I do not see them implemented.

Best regards,
Krzysztof

