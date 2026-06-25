Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75F323DD86B;
	Thu, 25 Jun 2026 11:54:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782388450; cv=none; b=QMI4ONMsVvRQnMLM7YPV+6W7DpzX/jrWAFHzfbnThfNuM6CVdGTzVF53/hGD4OL9YgFnFVNmB9AgSaxNXspWbyM+ePoouWQtgTPJFRpn39Wzryu5xWhM8k4lVxpGVvAuxGGzJHn2dNtXgt0ReEOJocF9j0Z6a1ovYWV3Qp5mvSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782388450; c=relaxed/simple;
	bh=pObLqJ4n/zA1aNYSUm/jeY3URuQjkNRFFhUBXMhFj3g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=tsXjJ3t+0/u5OnWZ9HqV8dtaj7eywHO1e6iUvBZAEFanuKSw69VtIl8pWIkqh5xBLhax/HLYs0bivf76EUPExuORj1rjCrPt9m4cNO8FjlXAY6+SrhSr2ze88093u+N+8vd6Fv0O+bTj+STM8nuumEeGvkcpQVF/WHaOi5/h4sA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HR5r8SBi; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HR5r8SBi"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 17F1EC2BCB4;
	Thu, 25 Jun 2026 11:54:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1782388450;
	bh=pObLqJ4n/zA1aNYSUm/jeY3URuQjkNRFFhUBXMhFj3g=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=HR5r8SBiQ8tkO1HgM2JaFavaiFpMA+DhsemBebjuZHeFMpVsybbIUbatZIHk8KG7f
	 gMDyKWLVDuRVRrT9z8yMSpnLo+teNSe5sPM2icKMGyErkvw4tWeyEcAeK8XGDDguWT
	 AjmbraOuDbUr0NWyy3kXbqwCFTovTqy0tz68HVHwwGJqNqxlG9rH5tdD0ZOrVKELU6
	 rtUIHSNEf6q2athM0KVYoHwhsaPouGTqV5cPqTq2iAOjd2d+W+JFFopFj9rPEgjJ+C
	 VSFUjzT2QvHKhcEVLKT5vr9ZW3JvIm2mPmUXWVJZI1EVFfUcQKB6HxTeRvENJVWMWb
	 EMlB0eu4XTdqA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFC84CDE007;
	Thu, 25 Jun 2026 11:54:09 +0000 (UTC)
From: Bryam Vargas via B4 Relay <devnull+hexlabsecurity.proton.me@kernel.org>
Date: Thu, 25 Jun 2026 06:54:09 -0500
Subject: [PATCH] thunderbolt: bound the DROM dual link port number before
 indexing sw->ports
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260625-b4-disp-9f8d8a2d-v1-1-d767f256c54b@proton.me>
X-B4-Tracking: v=1; b=H4sIAOAWPWoC/x3MPQqAMAxA4auUzAZq8f8q4hCbqFm0tCBC8e4Wx
 294L0OSqJJgMhmi3Jr0OgvqyoA/6NwFlYvBWdfZzrW4NsiaAo7bwAM5RiKx4olrKz2ULETZ9Pm
 X8/K+H0oXMz9iAAAA
To: Yehezkel Bernat <YehezkelShB@gmail.com>, 
 Mika Westerberg <westeri@kernel.org>, 
 Andreas Noever <andreas.noever@gmail.com>
Cc: linux-usb@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782388448; l=2331;
 i=hexlabsecurity@proton.me; s=proton; h=from:subject:message-id;
 bh=oQprZsRa+Yn+IzGYZzrPZZv+52PjopLTeMKqCJsO2eE=;
 b=tb5cV0h3El2T+Z3H2HXyL03+rN77WdtqE5usadTPRyXY3vNNre07S38p0ApOTnboonPA588hp
 i1+LJTTiowJB1YSfBYcZHI5XZe6s9USsUMMf4HWVWE19eUS2bC1n6/o
X-Developer-Key: i=hexlabsecurity@proton.me; a=ed25519;
 pk=dmppBMZNLLoPzxHi9l8tZDzEZUunPbgsYqIZYXeUrL0=
X-Endpoint-Received: by B4 Relay for hexlabsecurity@proton.me/proton with
 auth_id=814
X-Original-From: Bryam Vargas <hexlabsecurity@proton.me>
Reply-To: hexlabsecurity@proton.me

From: Bryam Vargas <hexlabsecurity@proton.me>

tb_drom_parse_entry_port() validates the device-supplied header->index
against sw->config.max_port_number before indexing sw->ports[], but the
sibling field entry->dual_link_port_nr -- a 6-bit value also read from
the DROM -- indexes the same array with no such check. A malicious or
malformed Thunderbolt device can set dual_link_port_nr beyond the
allocated sw->ports[] (max_port_number + 1 entries), producing an
out-of-bounds tb_port pointer that is stored and later dereferenced.

Reject a port entry whose dual_link_port_nr exceeds max_port_number,
the same bound already applied to header->index.

Fixes: cd22e73bdf5e ("thunderbolt: Read port configuration from eeprom.")
Cc: stable@vger.kernel.org
Signed-off-by: Bryam Vargas <hexlabsecurity@proton.me>
---
Reachable only from the device side -- a malicious or malformed DROM, read at
enumeration -- so this hardens against an untrusted Thunderbolt device, not a
remote attacker.

I have no Thunderbolt hardware, so this is by source inspection plus an
out-of-tree KASAN module mirroring the &sw->ports[dual_link_port_nr] indexing:
with dual_link_port_nr = 63 on an 8-port switch the unpatched arithmetic
reports a slab-out-of-bounds read 1864 bytes past the kmalloc'd ports[]
object, while the bound and an in-range control run clean. Reproducer on
request.
---
 drivers/thunderbolt/eeprom.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/thunderbolt/eeprom.c b/drivers/thunderbolt/eeprom.c
index 5681c17f82ec..2a13fa6888ba 100644
--- a/drivers/thunderbolt/eeprom.c
+++ b/drivers/thunderbolt/eeprom.c
@@ -394,9 +394,16 @@ static int tb_drom_parse_entry_port(struct tb_switch *sw,
 			return -EIO;
 		}
 		port->link_nr = entry->link_nr;
-		if (entry->has_dual_link_port)
+		if (entry->has_dual_link_port) {
+			if (entry->dual_link_port_nr > sw->config.max_port_number) {
+				tb_sw_warn(sw,
+					"port entry has invalid dual link port number %u\n",
+					entry->dual_link_port_nr);
+				return -EIO;
+			}
 			port->dual_link_port =
 				&port->sw->ports[entry->dual_link_port_nr];
+		}
 	}
 	return 0;
 }

---
base-commit: 502d801f0ab03e4f32f9a33d203154ce84887921
change-id: 20260625-b4-disp-9f8d8a2d-aae0ecad10e7

Best regards,
-- 
Bryam Vargas <hexlabsecurity@proton.me>


