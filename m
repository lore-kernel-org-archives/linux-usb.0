Received: from mta1.migadu.com (out-235.mta1.migadu.com [95.215.58.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1254D2BE65B
	for <linux-usb@vger.kernel.org>; Fri, 21 Aug 2026 04:17:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787285881; cv=none; b=SvkJ39yO6nOY2p36jckbkNtTGwzzus1y2bEldqiFqqv2zlhD9K4uPih8nOnDlXXN6S9FE1zHvJoAj+WLCDxb/r/gr4GnmojV+naYFbI5tR3rGThw0oyyZ2u3A+LUU93wSOmNGg4diDnKWg3l5YzWWES/5qC8Ufeo46xUrD3283I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787285881; c=relaxed/simple;
	bh=Kaob0xBXv6KFmTVwNElHZy6JxuBgW/R+aOKPIun0ZVQ=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=g1IYa+ePDq7eBWw0mHc7WYkWmwxQg0kRPLRYvXMU9MZ5FzoTYXaRz2LbNmyKE6E1SXM5o2JHvIP0gMB5fNTPUQ4RF3YuEeewfAjnaV/GdZUS0LGC9PFIj3esssadCnw4u/7PQ0K4NpwRxySj5q0LN5PzjrnBJIFFDvNIU0Hy1g4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=Aae1+uXb; arc=none smtp.client-ip=95.215.58.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="Aae1+uXb"
X-Envelope-To: linux-usb@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=Kaob0xBXv6KFmTVwNElHZy6JxuBgW/R+aOKPIun0ZVQ=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1787285877; v=1; x=1787890677;
 b=Aae1+uXbkEO4RVKarSp5WBxgF7s/yh326qXFaSwhq6YwA/dKDUggAY58ObKPAqAbtMtfTTow
 S7JGWO+ZRsoAn7/Q4KB8x1poN901TmzSXM17C8bLd2lN3ZS9K3Bpemwzo4cdD6enr3hPfBc7EKe
 d+mrXbG58lwzDG96EOXnaBEA=
X-Envelope-To: linux-usb@vger.kernel.org
Received: from localhost (114.94.8.21)
	by smtp.migadu.com with ESMTPS id 782bfd1962df596d;
	Fri, 21 Aug 2026 04:17:56 +0000
X-Mizu-Trace-ID: 782bfd1962df596d
X-Migadu-Flow: FLOW_OUT
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 21 Aug 2026 12:17:53 +0800
Message-Id: <DKUBYR4UOS5O.364CXD8TYLPI5@linux.dev>
Cc: <linux-usb@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
 <spacemit@lists.linux.dev>, "Troy Mitchell"
 <troy.mitchell@linux.spacemit.com>, "linux-riscv"
 <linux-riscv-bounces@lists.infradead.org>
Subject: Re: [PATCH 0/6] Add SpacemiT K1 USB2.0 controllers support
From: "Ze Huang" <huang.ze@linux.dev>
To: "Junzhong Pan" <panjunzhong@linux.spacemit.com>, "Ze Huang"
 <huang.ze@linux.dev>, "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
 "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, "Yixun Lan"
 <dlan@kernel.org>, "Xu Yang" <xu.yang_2@nxp.com>, "Peng Fan"
 <peng.fan@nxp.com>, "Peter Chen" <peter.chen@kernel.org>, "Philipp Zabel"
 <p.zabel@pengutronix.de>, "Paul Walmsley" <pjw@kernel.org>, "Palmer
 Dabbelt" <palmer@dabbelt.com>, "Albert Ou" <aou@eecs.berkeley.edu>,
 "Alexandre Ghiti" <alex@ghiti.fr>
X-Mailer: aerc 0.21.0-146-gb5c16ebe1835
References: <20260812-b4-spacemit-k1-usb2-v1-0-f28cf29e522b@linux.spacemit.com> <DKU91NS0JNRS.SLSXQO6JHRLM@linux.dev> <A048E078785BB086+381938ba-e0ab-4764-a5c4-9d2434d0abe3@linux.spacemit.com>
In-Reply-To: <A048E078785BB086+381938ba-e0ab-4764-a5c4-9d2434d0abe3@linux.spacemit.com>

On Fri Aug 21, 2026 at 11:28 AM CST, Junzhong Pan wrote:
> On 8/21/2026 10:00 AM, Ze Huang wrote:
>> On Wed Aug 12, 2026 at 5:26 PM CST, Junzhong Pan wrote:
>>> The SpacemiT K1 SoC has two USB2.0 controllers, one has Dual-Role
>>> support, but the hardware has no internal OTG registers, the other is
>>> Host only. These controllers are compatible with Chipidea USB2 driver
>>> with some flags set and reset control support.
>>>
>>> This series is based on 7.2-rc1 and has been tested on Banana Pi F3
>>> development board.
>>>
>>> A self-powered USB device/hub is needed to test the host function of th=
e
>>> dual-role controller on Banana Pi F3, a MINI-PCIe USB2.0 module (a
>>> cellular module e.g.) is needed to test the host only controller.
>>>
>>> Signed-off-by: Junzhong Pan <panjunzhong@linux.spacemit.com>
>>=20
>> Tested on OrangePi RV2.
>>=20
>> To use USB2.0 Type-A port as host on this board, usb2_0 needs:
>>   - dr_mode =3D "host"
>>   - a vbus-supply regulator driving gpio126
>>=20
>> Tested-by: Ze Huang <huang.ze@linux.dev>
>>=20
>
> Thanks, then I'll add rv2 dts node in the next version. Can you
> test again later ?

Sure

>
> Thanks
