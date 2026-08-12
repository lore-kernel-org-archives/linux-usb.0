Received: from smtpbg151.qq.com (smtpbg151.qq.com [18.169.211.239])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FCC236C5AE;
	Wed, 12 Aug 2026 01:52:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=18.169.211.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786499552; cv=none; b=tc2ZjkNkg6z5BwjcMlsOP+5qjcvRBhkt3HUX/OsytGSwoU5FZper6bB/rCCmPehTanYs+0CPkBFDloYwMCRMGctkAKYiyUT8DXVSaP4sBIaIj6OcNcXH6pKk4RNfrDtz+Y25XsCyIMnBsBDmFaII/1FWGQOgUoc+pMISz5l2PWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786499552; c=relaxed/simple;
	bh=grEAOtJhi5RsjPWa/2UX8I4v8meAJr82nLNq3VSDOdA=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=iN7JceNf49CV2TMH8hZ2cVfbCiqrCm5As9OAzriWgRfsOJcaAnQxTo/ZFor8WX1+uazK+ayp+b6m74jDnx/EVrJ9FgQ25R8+Ad2kwvrwSolDXUQmjiHlyd5LFmZN3luLamC5pGMnYthrEFM0Rgu/tBnTnXjlxm/d4sTeaKzINmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=UC1c1SKd; arc=none smtp.client-ip=18.169.211.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="UC1c1SKd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1786499527;
	bh=grEAOtJhi5RsjPWa/2UX8I4v8meAJr82nLNq3VSDOdA=;
	h=Message-ID:Date:MIME-Version:To:Subject:From;
	b=UC1c1SKd8sJ+aG4zeoDuEUE9EFM1hButlrLg22JkUSSZ//c22QKsi09aasVC5xfkB
	 bgoj2KVZHNX1NRlL4ZgpI7xZ8cRtUlBMb73I8qTl7bgCrKhyTEqHlK1uV/4Lfm+ge0
	 5hlu6/D4tXf1pAThTtFFGCXirJ7MPLIsGxrQyap4=
X-QQ-mid: esmtpgz11t1786499522t1745d86c
X-QQ-Originating-IP: RYyvMLups5hdX9gVjd+qE4m2j7l6aY3OEC4ynxzuD4c=
Received: from [192.168.1.100] ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 12 Aug 2026 09:51:57 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 3423747404799107751
EX-QQ-RecipientCnt: 7
Message-ID: <9D8A269956139B11+3eb3ee16-7ece-42c6-ad28-80f0d8be50a2@linux.spacemit.com>
Date: Wed, 12 Aug 2026 09:51:56 +0800
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: gregkh@linuxfoundation.org
Cc: Thinh.Nguyen@synopsys.com, linux-kernel@vger.kernel.org,
 linux-usb@vger.kernel.org, panjunzhong@linux.spacemit.com,
 peixin.xie@linux.spacemit.com, troy.mitchell@linux.spacemit.com
References: <2026081244-crushed-headband-dc5a@gregkh>
Subject: Re: [RFC PATCH] usb: dwc3: core: resume xHCI child on runtime resume
 in host mode
Content-Language: en-US
From: Junzhong Pan <panjunzhong@linux.spacemit.com>
In-Reply-To: <2026081244-crushed-headband-dc5a@gregkh>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz5b-2
X-QQ-XMAILINFO: MMnlQ3K1xHDW/1QAKvga2KfvvWPyE5LpGd9dh+i2/DAGPjI8G0n+BTf6
	C58uZEX2sdrLFOMfZEnwrpZGmpPgYt9h13cqegs01pigsSWXRzR7o+oUgqECsNIShgDPNi1
	rRKtsf+J96YAQujkWR3wZFkYgIbkTFDIZg2ZfqRw6BKogzIdh4XBaxsLad1ONL/21MW5BJ2
	lA8D+17NHTZ6AO7nqZPuhI0smHoCVCpR2sk0g+AFlHs5pLWDC8MzmRpmpgoiuOOsGSNjuLq
	EAVjBSRXwieqWkXYrkOj7M0Ed+D8bYWUTyHbmEIxy+mae2ARhBDlBvzV59e9VHZ/q+xqml3
	DBqqEu2MeETAx0wtr6XxQLrdF1b0x1dbbD39lhDuEEvlUR5hDB8gsVxnUccguAdckevJVDz
	OXP7Hy7DwQi4k0MIUBQHFbishagzJ3stPajHEjsAi4rRorvUBJaNQWTIWH/8/C5+MUsfBFX
	MDbLBrShy7182DE9QB6eDT2Io+63yLq5NzPTypEHbDKjodHirmelqk42H8P7e65mVjO9TAQ
	6YSAJs5AaFpXZHRHkS8rgXwNpzWRGWTdQZZe9DE8Yl1q0VgO9a1Q/u1zFNyIPn9bTmdBFWV
	sXCuy1BUJp5s0NfjRkvS551Dn4PdhRkE1gme0DpLEJuQ00+vN/YM5OG/yQ93KL6O87tjd9s
	vkj9/dNqSV67+4x+zNrZpuFWD9wl6dx+fxZZx72ImJh5Q/HGPkWaFaHwJN9Y0yP9j+R7CpK
	zqBaBlKxFxgoW8rUhWtw79p3NCXL0YS6SYGlhJTn1miKthnNYd7d9QPLsTUcdAViA7bl5n+
	n3NcDoDfhp8HIqt7qY4gnY4usvx5wEbxMgt4s0Ane6wStMC5QpU5qUbMYkqvb9xp8NzzX5r
	NPZzUc2cLBKYFZI91gj4HxMX6dLUHYYT/rJH8PyUhiWeoPYoTGDZJRaav4Ep/oM53e4/iH3
	crblHqEsBe5qRIKgkeoQIJJG752wp5KX025N5xFWejR16K0t6KBpS4AgHW0l9dpyFKGqgKc
	cgApNgdaV6+goE682AwmLzWK7taJOrItnjRiK/QHI05x3d9iQs
X-QQ-XMRINFO: NyFYKkN4Ny6FuXrnB5Ye7Aabb3ujjtK+gg==
X-QQ-RECHKSPAM: 0

Hi Greg,

> Did you get LLM help with creating this patch?

YES and I missed the documentation [1] that work with LLM.
I'll add the tag in the next version.

Since this is an RFC patch, I would appreciate any comments
you may have on the approach of handling runtime resume for
ACPI dwc3 host.

[1] https://docs.kernel.org/process/coding-assistants.html

Thanks!
