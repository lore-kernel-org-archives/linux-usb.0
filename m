Received: from pio-pvt-msa2.bahnhof.se (pio-pvt-msa2.bahnhof.se [79.136.2.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBA54302149
	for <linux-usb@vger.kernel.org>; Sat, 28 Mar 2026 16:30:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.136.2.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774715429; cv=none; b=YDmYq0EKAOxXSQLBq4mxy64GwG8JKswfQ4+0nCyBNjqyAdzK0PVJsQPwOL7362EGSD4mQy4ALo+6ASSPxOeuEGhVYuOFWc3d0Ye5CMieB/oAa74VHTW6r+jNeOKte4rGhYT7DJDoDtMdA1m/vvrnhQa6vtCPwR0qFeRaETXp/M0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774715429; c=relaxed/simple;
	bh=S+Ern+NwCyNAt8dBSUbuZYtxT4O5ZZcMxYTPluAccUA=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Content-Type; b=YHaJhjg17DZ9/XtQLJ19IB8jeLTfgO+j43omMDzbFz2uiGfjZPcW4ToylKfXv0IjKro6dXfKyI/K4BpuJ0u/MGElFPV+r74nxUd4s+NA+tbu7+Q6iE666++w/yAOL9o6Hf115BzEhY0f/iB4bnAmgokLvSxAyHM3Z6EUty1lYfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bahnhof.se; spf=pass smtp.mailfrom=bahnhof.se; dkim=pass (2048-bit key) header.d=bahnhof.se header.i=@bahnhof.se header.b=XSjV1ia9; arc=none smtp.client-ip=79.136.2.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bahnhof.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bahnhof.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bahnhof.se header.i=@bahnhof.se header.b="XSjV1ia9"
Received: from localhost (localhost [127.0.0.1])
	by pio-pvt-msa2.bahnhof.se (Postfix) with ESMTP id 5D66E3F2A3
	for <linux-usb@vger.kernel.org>; Sat, 28 Mar 2026 17:23:50 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -2.1
X-Spam-Level:
Authentication-Results: pio-pvt-msa2.bahnhof.se (amavisd-new);
	dkim=pass (2048-bit key) header.d=bahnhof.se
Received: from pio-pvt-msa2.bahnhof.se ([127.0.0.1])
	by localhost (pio-pvt-msa2.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 96ELGbBiRYPh for <linux-usb@vger.kernel.org>;
	Sat, 28 Mar 2026 17:23:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bahnhof.se;
	s=default; t=1774715029;
	bh=pGhFEdy5aeCEIw48fFzcx1DBwh4sfBu3RPXkuLxZ6v8=;
	h=Date:From:Subject:To:From;
	b=XSjV1ia9OI9vNluyhOumFBJWpSSrdxDqcJqiYtDE/2c9naBEPbLQznLoHbLqhwW8D
	 tpZ8HDgiIStef9hOzzXpDaR7eh4EjlnvnkqCI8j9igwmNrZjFKLjh3IheB1JTpv5r9
	 Rx1r6g0rooDXbzX2Dmx6N826pfgQlwCnBJCeo8owEweC3bUmkeVyhwPtiNcsSH7N/0
	 Dxww0mLXmWhEq6nJ1YkvZVtDqw/pUi5inF5t3GZ5FuQ78IOU8Mm1Qse34EX6rtpaEb
	 ZuUaqMd3xJ+tTrD3X7lX6bX82Kd4TkI/IFWEEGNtgpcPngECMwolzgPsmUQXIwt1Mb
	 IfFvmoIYSirkg==
Received: 
	by pio-pvt-msa2.bahnhof.se (Postfix) with ESMTPA id 5BF123F226
	for <linux-usb@vger.kernel.org>; Sat, 28 Mar 2026 17:23:49 +0100 (CET)
Message-ID: <1717beab-848b-4927-8fa5-26fb5ae05495@bahnhof.se>
Date: Sat, 28 Mar 2026 17:23:48 +0100
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
From: Johan Gill <johan.gill@bahnhof.se>
Subject: UAS peripheral with unrecognized TRIM support
To: linux-usb@vger.kernel.org
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi, I have tested running Linux on the StarTech USB312SAT3CB USB 3.1 -> 
SATA adapter. It's a more stable UAS implementation than my previous 
adapter but the device is not recognized as supporting TRIM out of the 
box (kernel 6.19.9). The technical specifications at 
https://www.startech.com/en-se/hdd/usb312sat3cb indicate that TRIM is 
supported, so I enabled it by setting ATTR{provisioning_mode}="unmap" in 
a udev rule and then fstrim indeed seems to work when I run it. The 
specification claims that it uses ASMedia ASM235CM, but the device uses 
the StarTech vendor id and identifies as 14b0:0207.

It would be nice to have the adapter recognized as more capable out of 
the box. Should I aim at patching drivers/usb/storage/unusual_uas.h?


