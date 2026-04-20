Received: from mail-43171.protonmail.ch (mail-43171.protonmail.ch [185.70.43.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6710A3AB289
	for <linux-usb@vger.kernel.org>; Mon, 20 Apr 2026 18:21:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776709294; cv=none; b=ET/t9d5eeE0sIo7UHgDKZpI4IwcPCv5v3ZcSh5P7qJSgkzpoajWnF2laBuX0bk/IWoY7dBQ/0fAXiNaKPR6x46EuE+pBj6ZDNi5HZDsh2eZTw63fBVG+++LIZ0RonGfaoxRlSSUKJQNCwOVrjsUtu9n+cF8myexbQBvoB2olTlw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776709294; c=relaxed/simple;
	bh=a86wBCZ8FcWMZwEAnLyuLGfzrWdMRVEeqEVkdSJ4eJc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TQQYpV9RqW/2PwVQhdTpiQfkuHuJYMeZR9CaAqtearpy2NDNVl5OVNRCQTHp2JZHcR5eV6kdKNsY44rsSGLuuV65SP9ykBCDeA4kQ972Yi3lJ9KbYUf8f8a7P1YPHBNCLfjXGuwxDA4H0m3ponETRCeypddHM6VvTzgOspJ2wPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=interstellar.eu; spf=pass smtp.mailfrom=interstellar.eu; dkim=pass (2048-bit key) header.d=interstellar.eu header.i=@interstellar.eu header.b=dtiSTQZ9; arc=none smtp.client-ip=185.70.43.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=interstellar.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=interstellar.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=interstellar.eu header.i=@interstellar.eu header.b="dtiSTQZ9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=interstellar.eu;
	s=protonmail; t=1776709281; x=1776968481;
	bh=U6QW8H+mVzKMebf+OAfeRwVU/AIeHU7ID1WJmYZkn+I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:From:To:
	 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=dtiSTQZ9//mAQNSY2r/iB+xop/3HvSX+OUmR1oJgPZwshJTK6jbVClmhIxEEBcXxb
	 M4XYFhCqyetnKhVsBFf4RKOCoHxOdchL36JTCkLriL0IlzDmGOBWlJg0GUbKflGKgh
	 S4mHONcwiQplFDrZ6GuUBMq/GOBf2167HRVRQrzAMix9RhomfzgxvCsi4mjWGGaBrM
	 rWeO+wz6Wp5VJT1tEiQZl6fYU/SM6Y7+XZhiIiRr1N+aHgsuXXROwCKS01jaKD5Jpq
	 nqZsmHW9yNvVoG7ZIfSi1skG5zSX7a5pHyThpSTdZmle4DFplWg36JLCuc7qD+ScxS
	 HA1wgxOj8EfjQ==
X-Pm-Submission-Id: 4fzv2803skz1DDrp
From: Francesco Orro <ncesco@interstellar.eu>
To: incredibletails@tutamail.com
Cc: linux-usb@vger.kernel.org
Subject: Re: [BUG] USB-C DisplayPort Alt-Mode not detected on MSI Cyborg 15 A12VE (Alder Lake + RTX 4050)
Date: Mon, 20 Apr 2026 20:21:17 +0200
Message-ID: <20260420182117.257522-1-ncesco@interstellar.eu>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <OhsTeeC--F-9@tutamail.com>
References: <OhsTeeC--F-9@tutamail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

One of the symptoms you describe (no Type-C ports under /sys/class/typec)
matches a firmware quirk I recently ran into on an HP ZBook Fury G1i,
and posted a WIP patch for:

  https://lore.kernel.org/linux-usb/20260420172343.84456-1-ncesco@interstellar.eu/

In my case the HP "UcsiAcpi" SSDT exposes a _DSM function 2 (READ) whose
body is empty, so UCSI_VERSION stays 0x0000 and ucsi_init() bails with
-ENODEV. The patch (DMI-gated) bootstraps the PPM via _DSM func 1
(WRITE) at probe time and falls back to UCSI 1.2. After that,
/sys/class/typec/port* appears with partner alt-modes populated.

If the same firmware quirk is present on your MSI, adding its DMI match
to the quirk list in the patch should be enough to get typec ports to
show up. It won't necessarily fix the DP alt-mode negotiation by itself,
but it is a prerequisite for the typec stack to do anything.

Could you share:
1. `dmesg | grep -iE 'ucsi|USBC000'` from a fresh boot
2. The contents of your "UcsiAcpi" SSDT - run:
     sudo apt install acpica-tools
     mkdir /tmp/acpi && cd /tmp/acpi
     sudo acpidump -b
     iasl -d *.dat
     grep -lF 'UcsiAcpi' *.dsl
   and attach the matching ssdtNN.dsl
3. `cat /sys/class/dmi/id/sys_vendor /sys/class/dmi/id/product_name`

If point 2 shows an empty _DSM func 2 body similar to what I described,
we can add your laptop to the quirk list and you can test the patch
locally.

Regards,
Francesco Orro
