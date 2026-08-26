Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 089D41EFF93
	for <linux-usb@vger.kernel.org>; Wed, 26 Aug 2026 02:33:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787711632; cv=none; b=Mn5XyDu1zx1ooYar7oDh5dGqwauGXrAvwKm2eKZDW6uCs6KuDy//AGS7x9T0/OMqRD6y7HPRlBCA+iUHUwyi/iUsSs28aG57FSbzoKx5KYmmeECQfjwA0xbYtcdibxZL1xYkF1plXjJMjGak4ySK+5Y4z6ccrv6rDM8lnxF6clY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787711632; c=relaxed/simple;
	bh=EqVAHhSvC0xvJ3tZOwXzvGfdbjWtgA1xxgEs+V3nF2g=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=fK7jSRFLEyuXIocGfjhfpmMYoPEUrkjUxvdxRyOYNpQ8AU6jHPjna8n6MkORGAAMMxWskZF/5VEuNM/ZL82COuFmx9tWwAX4JBY/SvcqflP0fsYXi+/UPtZk1qQoix8OqyttnCSMIKM3gKMR1dRM5pISb34FTJzDtrEA79J6E64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=C5IlBVjv; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="C5IlBVjv"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 89D4FC2BCB8
	for <linux-usb@vger.kernel.org>; Wed, 26 Aug 2026 02:33:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1787711631;
	bh=EqVAHhSvC0xvJ3tZOwXzvGfdbjWtgA1xxgEs+V3nF2g=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=C5IlBVjvjJ5bx6SrO4ohAh1Y9YVcPB37xkrWnFHV7SLEdN3zD5E+b6LIDzKTuXoez
	 az2Ump96V3a8wX1Nk3lD6skKbzvsNrz+DLSEPeuzJErO1dLf/pF0iGkuJFr0+yUh1g
	 G7d0VV1o99yTe6IVrXYZkzjy4OkmIKy+XXaN7GwA4azObiK1fUW0iQvW8HDrzeopQ7
	 rXzX2PBDwy0/nKHJA+yimcceZVX5mpTCt5232Obz8cuAIEG9Urss2rq5zwKqKy9axK
	 nvbLTshpvwGPm9/yZBl9hD1+8zchAqxtMkJsTr2bGKnx6Vcx1wFiNvGqF2MT+3fhiF
	 sbgXszsmBKH5g==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 681F2C41613; Wed, 26 Aug 2026 02:33:51 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 221142] ucsi_acpi actively breaks USB-C PD charging on Lenovo
 Legion Pro 7 (Arrow Lake)
Date: Wed, 26 Aug 2026 02:33:51 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: trivial
X-Bugzilla-Severity: normal
X-Bugzilla-Who: alex@alstergee.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-221142-208809-cvqCzywdgA@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221142-208809@https.bugzilla.kernel.org/>
References: <bug-221142-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

https://bugzilla.kernel.org/show_bug.cgi?id=3D221142

--- Comment #2 from Alstergee (alex@alstergee.com) ---
Hi Wei,

Thanks for picking this up! Here's the DMI information:

`sudo dmidecode -t system`:

    Handle 0x0001, DMI type 1, 27 bytes
    System Information
        Manufacturer: LENOVO
        Product Name: 83F5
        Version: Legion Pro 7 16IAX10H
        Serial Number: <redacted>
        UUID: <redacted>
        Wake-up Type: Power Switch
        SKU Number: LENOVO_MT_83F5_BU_idea_FM_Legion Pro 7 16IAX10H
        Family: Legion Pro 7 16IAX10H

Contents of the requested `/sys/class/dmi/id/` files:

    sys_vendor       =3D LENOVO
    product_name     =3D 83F5
    product_version  =3D Legion Pro 7 16IAX10H
    product_family   =3D Legion Pro 7 16IAX10H
    product_sku      =3D LENOVO_MT_83F5_BU_idea_FM_Legion Pro 7 16IAX10H
    board_name       =3D LNVNB161216
    board_version    =3D SDK0T76461 WIN

Additional context that may be useful for matching:

    bios_vendor      =3D LENOVO
    bios_version     =3D Q7CN78WW
    bios_date        =3D 04/07/2026
    board_vendor     =3D LENOVO
    chassis_vendor   =3D LENOVO
    chassis_type     =3D 10  (Notebook)

The BIOS has been updated since I filed the report (Q7CN44WW -> Q7CN78WW,
April 2026). Symptoms are unchanged =E2=80=94 ucsi_acpi still returns empty=
 PDO
data and interferes with EC-side PD negotiation; blacklisting ucsi_acpi
still fully restores charging.

Also worth noting: the AMD variant of this laptop is DMI product 83RU
(Legion Pro 7 16AFR10H, BIOS prefix SMCN). It uses the same EC firmware
(ITE IT5508, EC ID 0x5508) and the community reports the same PD
negotiation failure there. It might be worth matching both product names
in the quirk if that's how the LG gram quirk is structured.

Currently running Ubuntu 26.04.1 LTS, kernel 7.0.0-30-generic.

Thanks,

Alex Bartz
eleso.app
FestivalWiFiGuys.com
Alstergee.com
[image: mobilePhone] +1 (801) 808-1498 <+1%20(801)%20808-1498>
[image: emailAddress] alex@alstergee.com <alex@festivalwifiguys.com>


CONFIDENTIAL & PRIVILEGED: This communication and any attachments may
contain information that is confidential, privileged, and/or exempt
  from disclosure under applicable law. If you are not the intended
recipient, any review, use, dissemination, distribution, or copying is
  strictly prohibited. If you received this in error, please notify the
sender immediately and permanently delete all copies.


On Mon, Aug 17, 2026 at 3:20=E2=80=AFAM <bugzilla-daemon@kernel.org> wrote:

> https://bugzilla.kernel.org/show_bug.cgi?id=3D221142
>
> Wei Huang (huangwei@kylinos.cn) changed:
>
>            What    |Removed                     |Added
>
> -------------------------------------------------------------------------=
---
>                  CC|                            |huangwei@kylinos.cn
>
> --- Comment #1 from Wei Huang (huangwei@kylinos.cn) ---
> Hi Alstergee,
>
> Thanks for the detailed report, and for verifying that blacklisting
> ucsi_acpi restores normal PD negotiation on this machine.
>
> The cleanest way forward is a DMI quirk for this model in
> drivers/usb/typec/ucsi/ucsi_acpi.c - there is already a quirk mechanism
> there, used for a similar EC firmware problem on LG gram laptops. To
> write the quirk, I need the exact DMI identification strings of the
> machine, which are not part of the report.
>
> Could you please attach the output of:
>
>     sudo dmidecode -t system
>
> Alternatively, the contents of these files:
>
>     /sys/class/dmi/id/sys_vendor
>     /sys/class/dmi/id/product_name
>     /sys/class/dmi/id/product_version
>     /sys/class/dmi/id/product_family
>     /sys/class/dmi/id/product_sku
>     /sys/class/dmi/id/board_name
>     /sys/class/dmi/id/board_version
>
> With that information I can prepare a patch and submit it upstream.
>
> Thanks!
>
> --
> You may reply to this email to add a comment.
>
> You are receiving this mail because:
> You are on the CC list for the bug.
> You reported the bug.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
