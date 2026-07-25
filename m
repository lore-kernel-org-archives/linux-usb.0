Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F9A8320A14
	for <linux-usb@vger.kernel.org>; Sat, 25 Jul 2026 16:30:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784997041; cv=none; b=fJUO7YRA2p3sZ6ne8NZcIfc35KAFxbmQlvpdZUOe1Ila7gkv1rDCEtgq7EerxLWpiV5uDMjoqcEQXY1ZdBUmud9MNjbI4D7QQHc/5RO2DIEMsGSNAGG/MDGuJAQByycnjyAaonsCQXINXGVbTqo4M9ajcKC3H+7ixYG/p+a4Wy8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784997041; c=relaxed/simple;
	bh=Id7fi9BOC4wk7DFw9vNAf7V/oRa7M1+jR/p6J0PR1gA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 MIME-Version:Message-ID; b=nX5i3Kl2f5hJ5akCO/FFW6QBlDR64i4JOQjvxlj6WO5a7Cj72XJ1v4hn0iKFH8XKERTIB00Sj9t2+njGcg//596ymVpF5XuvHgqoJR+yJCby/p57LkE8Gx7BihyuOvW6JUCQG2Sx/NLpwjy7O0Yc5IXLnZbpqhw9FKHWLDbwV1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=InhY+v8T; arc=none smtp.client-ip=220.197.31.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="InhY+v8T"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:To:Subject:Content-Type:MIME-Version:
	Message-ID; bh=Id7fi9BOC4wk7DFw9vNAf7V/oRa7M1+jR/p6J0PR1gA=; b=I
	nhY+v8TTzu1H7js7AoW+Yzfd5abDwT9n24JzdIa0NEK2wJ86bRbYgdLYi3FntVzw
	DLQJrMG5O5ycFVgP6A2/bdmgZ2SBf2Vp0PNW7mDfUGmacafEMa64UUgr6bitKgvY
	vl/DMANEHWM4BYtVfPsscB0EDgM10jG/1eh2a1bjHU=
Received: from 19888972804$163.com ( [2404:c140:2005:1:86:d6d4:1b5f:ca4e] )
 by ajax-webmail-wmsvr-40-117 (Coremail) ; Sun, 26 Jul 2026 00:30:00 +0800
 (CST)
Date: Sun, 26 Jul 2026 00:30:00 +0800 (CST)
From: "jiale yao" <19888972804@163.com>
To: "Johan Hovold" <johan@kernel.org>
Cc: "Oliver Neukum" <oneukum@suse.com>,
	"Greg KH" <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org
Subject: Re:Re: [PATCH] usb: serial: fix slab out-of-bounds read in
 interrupt URB callback
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2023.4-cmXT build
 20260511(2e539873) Copyright (c) 2002-2026 www.mailtech.cn 163com
In-Reply-To: <alTuPh7hs1X-9lcA@hovoldconsulting.com>
References: <20260712170012.3503601-1-yaojiale02@163.com>
 <2026071325-onward-sabotage-13e8@gregkh>
 <alS3pmrV-FwEsVvA@hovoldconsulting.com>
 <b775e3e1-af60-4291-a875-7185dc29769d@suse.com>
 <alTuPh7hs1X-9lcA@hovoldconsulting.com>
X-NTES-SC: AL_Qu2TBvWSuEgr5iGfY+kdm0kTgus9XsezvfQk3YBXc/4EniDRywcGb1JTAFzp88idNwq9iSaXWyhL5e5ZQql9tS/gtzSdld3XYKqZ+oXLQA==
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=GBK
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <28dabd57.312b.19f9a1cb3fb.Coremail.19888972804@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID:dSgvCgD3X5yI5GRqsm4lAA--.6343W
X-CM-SenderInfo: x1dryxhdohiji6rwjhhfrp/xtbC7wgPSWpk5IifMQAA3t
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==

CgpIaSBKb2hhbgoKVGhhbmtzIGZvciB5b3VyIHJldmlldy4KSSBoYXZlIHN1Ym1pdCB2MiB3aXRo
IGNoYW5nZSBsb2cuCgpKaWFsZSBZYW8KCgoKCgoKCgoKCgoKCgpBdCAyMDI2LTA3LTEzIDIxOjU1
OjEwLCAiSm9oYW4gSG92b2xkIiA8am9oYW5Aa2VybmVsLm9yZz4gd3JvdGU6Cj5PbiBNb24sIEp1
bCAxMywgMjAyNiBhdCAxMjo0NDoxN1BNICswMjAwLCBPbGl2ZXIgTmV1a3VtIHdyb3RlOgo+PiBP
biAxMy4wNy4yNiAxMjowMiwgSm9oYW4gSG92b2xkIHdyb3RlOgo+PiAKPj4gPiBCdXQgbG9va2lu
ZyBhdCB0aGlzIGFnYWluLCB0aGUgY2hlY2sgc2hvdWxkIGJlIHNwbGl0IGluIHR3bzogb25lIGZv
ciB0aGUKPj4gPiBzdHJ1Y3QgdXNiX2N0cmxyZXF1ZXN0IGhlYWRlciBhbmQgb25lIGZvciB0aGUg
bW9kZW0gc2lnbmFsIHN0YXRlIChpbnNpZGUKPj4gPiB0aGUgY29uZGl0aW9uYWwpLgo+PiAKPj4g
Tm90IGp1c3Qgc2hvdWxkIGJlLiBJdCBtdXN0IGJlLgo+Cj5ZZWFoLCBJIG1lYW50ICJzaG91bGQi
IGluIHRoZSBuYXR1cmFsIGxhbmd1YWdlIHNlbnNlIG9mIHRoZSB3b3JkIChub3QKPiJTSE9VTEQi
IGFzIGluIHJmYzIxMTkpLgo+Cj4+IERvaW5nIHRoZSBzYW1lIGNoZWNrIGZvciBib3RoIGNhc2Vz
IG1lYW5zIHRoYXQgYW55IG9mIHRoZSwgcHJlc3VtYWJseQo+PiBhbGxvd2VkLCBtZXNzYWdlcyB0
aGUgZHJpdmVyIGRvZXMgbm90IGNhcmUgYWJvdXQgd2lsbCB0ZXJtaW5hdGUgY29tbXVuaWNhdGlv
bi4KPgo+SW5kZWVkLgo+Cj5Kb2hhbgo=
