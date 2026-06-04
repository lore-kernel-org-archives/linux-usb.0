Received: from dilbert.mork.no (dilbert.mork.no [65.108.154.246])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4045636BCDD;
	Thu,  4 Jun 2026 09:50:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.108.154.246
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780566657; cv=none; b=PO8gXFOkLl+qoP6/W3JVMe+mc4IUAcm/QkBUXilhobRBXl9yD1i3I29DzT/vpgFFlEkX8Fa84Y89bpKG064S+QxS5qbNWzocObc6gFwHmocPyKScE1kqoCURQgWIw2/avV/bJ/GCgW4ByafVsa0jQUE/ETNnP+LG7JSLb/fTQco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780566657; c=relaxed/simple;
	bh=Rci4wJz7tM5FCL6R8d9ZTGE2T/GW+hduQyU1tOP3B10=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=PtDqzoeXfbjiuPqSdLH0eiLoQX4MRqPCnvXk2OL5D+1TNyPwSg9UFXs7FVgMa+D/maciVumeqGwSZ1zwqiBUCrySxjAyyNQfsSUu6i2clH7gdCKF6UngTRbunEx3PFE2TC9jsuUbDylDF8L58bXCHchT/g6W6P/LLVWkIPiCR5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mork.no; spf=pass smtp.mailfrom=miraculix.mork.no; dkim=pass (1024-bit key) header.d=mork.no header.i=@mork.no header.b=EovQ9NH6; arc=none smtp.client-ip=65.108.154.246
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mork.no
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=miraculix.mork.no
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mork.no header.i=@mork.no header.b="EovQ9NH6"
Authentication-Results: dilbert.mork.no;
	dkim=pass (1024-bit key; secure) header.d=mork.no header.i=@mork.no header.a=rsa-sha256 header.s=b header.b=EovQ9NH6;
	dkim-atps=neutral
Received: from canardo.dyn.mork.no ([IPv6:2a01:799:10e2:d900:0:0:0:1])
	(authenticated bits=0)
	by dilbert.mork.no (8.18.1/8.18.1) with ESMTPSA id 6549chCj255320
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=OK);
	Thu, 4 Jun 2026 10:38:44 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mork.no; s=b;
	t=1780565923; bh=vrnPiHwr2HvIiPSR66LgspDHmNnDMyd8H41XU8KhXn8=;
	h=From:To:Cc:Subject:References:Date:Message-ID:From;
	b=EovQ9NH67GMcvhSr37/QLqFuWMO8gpEyMKMgO7nJXVn7DFHcWw8AEYJ7xhIOnNEj2
	 B5chPIArH/CEglcqdj0P4YMAiL4F3LGmkzQ6Q6wq9nRbH18PbMECKaFc72DJT+OO9D
	 ZchqtlH3atNObMe/lCHIhEO/DNthehQkPExldO1Q=
Received: from miraculix.mork.no ([IPv6:2a01:799:10e2:d90a:6f50:7559:681d:630c])
	(authenticated bits=0)
	by canardo.dyn.mork.no (8.18.1/8.18.1) with ESMTPSA id 6549chEY1198534
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=OK);
	Thu, 4 Jun 2026 11:38:43 +0200
Received: (nullmailer pid 550250 invoked by uid 1000);
	Thu, 04 Jun 2026 09:38:42 -0000
From: =?utf-8?Q?Bj=C3=B8rn_Mork?= <bjorn@mork.no>
To: Greg KH <greg@kroah.com>
Cc: SARDARUDDIN SYED <ssardaruddin2002@gmail.com>, linux-usb@vger.kernel.org,
        stern@rowland.harvard.edu, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Documentation: ABI: remove outdated USB power/level
 removal notice
In-Reply-To: <2026060423-ipod-tarantula-4f5d@gregkh> (Greg KH's message of
	"Thu, 4 Jun 2026 08:45:57 +0200")
Organization: m
References: <20260530233410.1718-1-ssardaruddin2002@gmail.com>
	<2026053140-approve-enroll-5681@gregkh>
	<CAEUfWQg7msH_qsER7nL5_855puJYsj4ztT+DrRThfbih8TObnw@mail.gmail.com>
	<2026060423-ipod-tarantula-4f5d@gregkh>
Date: Thu, 04 Jun 2026 11:38:42 +0200
Message-ID: <87wlweir19.fsf@miraculix.mork.no>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Virus-Scanned: clamav-milter 1.4.3 at canardo.mork.no
X-Virus-Status: Clean

Greg KH <greg@kroah.com> writes:

>> I looked into the history and current implementation of power/level.
>>=20
>> The attribute is still implemented in drivers/usb/core/sysfs.c and is st=
ill
>> documented as a deprecated interface. The obsolete ABI entry was added w=
hen
>> power/level was deprecated in favor of power/control, but the interface
>> itself remains present.
>>=20
>> I wasn't sure whether you meant removing the obsolete documentation entry
>> or removing the deprecated interface itself, so I wanted to clarify befo=
re
>> sending a v2.
>
> Why not remove both?

Won't that break stuff for anyone still using the power/level attribute?
Time has proved that no one cares about deprecation warnings.

Why not implement Alans original wish in commit a90309860b09 ("USB:
deprecate the power/level sysfs attribute") instead:

    It would be nice to replace power/level with a symlink to
    power/control, but at the moment sysfs doesn't offer any way to do so.

I believe this has been possible since commit 9255782f7061 ("sysfs: Wrap
__compat_only_sysfs_link_entry_to_kobj function to change the symlink
name")


Bj=C3=B8rn
