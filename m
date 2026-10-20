Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792533199;
	b=qXvHo95flUvtoswIW3LKi46yIr/VLhX72CZYnIoYffqlB6o3A6Gf5oNOzg3uQuhqJ2qY
	 h/kW6ZyhsBvn6b1OAYFDITEmALpsQtEq9q+YzEVnHmWpR/duECMyVwfIiqmWfRDvrpsll
	 iVlT1t056cyMeNffy3G2NYDz/7mVIXxeFFcuRY8ijE8B9OQZLD3mxoxGRIBTu//ggYlUY
	 LH6AoYW8uNdvFO8CzpTS/0e9zj7lJL04qKAGFYVWOrlL10tiKTEyD7ZWwCdH8Ij9GTG/a
	 BegkfyuV42KyWZ44YYvsQYPRNG6GFtgiWNTbEGnHy4y8WqOCSGMlDzIrUjn57w0uAvQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792533199;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type;
	bh=2Oxt968xPFJW3/QbQOodnOToubiexBO83YjHsAXgGQ8=;
	b=O8PCTDiTijcT7ZwzzRCT5rRaeVOfk1ZEunx45DRd+PWJCNs5BHc8fL87s0yOvUi8QGgN
	 QQSNSkerS+oLdcSJGNXHko/5NH7oR0k4SuAVc4v80CShpBuyL83N2NJCYCkDfOM4L6Wwu
	 JYFCGNnVkLQvixLyLaC8O+O1BFlRzAWAUsqlweDsu1yMJdQAYVpE/hBWQqYQE65Im816D
	 zjsPvyXFwQpLSD1o5vz0jsKNAMB41fRLn9jhPEIazm3qDpeW+e0TCI6EhFJgIE20qdq5w
	 X5mttZLKD5BG3k8D4cD83TrZb5y8GqJ+sq7uEwHNq80rtwf/k7+cmgNQydPGgI5oHnA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=nSUJFN1l;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.51
Received: from mail-yx1-f51.google.com (mail-yx1-f51.google.com [74.125.224.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5648606A31D
	for <linux-usb@vger.kernel.org>; Tue, 20 Oct 2026 21:53:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A5648606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=nSUJFN1l
Received: by mail-yx1-f51.google.com with SMTP id 956f58d0204a3-6711f05fb14so65451d50.2
        for <linux-usb@vger.kernel.org>; Tue, 20 Oct 2026 14:53:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792533198; cv=none;
        d=google.com; s=arc-20260327;
        b=tCeVgErE1dZ8ULnBhcFHGYQExvn5sOXQ2yEvM9y84+0iajNU2oijAk8tQ4N1YzsAjO
         3r+xkX3g11ngiHqpHai/YqYmwkut8DcPbJVTkZDSQUB332TNdWirgnMLOC2i6w+tpnHq
         kguJXE91slvaPB1VY325XhY5egJxGJshSVN3mo/5+MgUEFpdeA1UOV1gDp1siN7leiuW
         t+hqvjRN4CF7ojEEW0LWBViinVL4Me0zPxDCzP74NGbumUXCmnUhnoRBkQlHLqpxUOpl
         PGwrNa6tk8cQnfZhnjoAllllLurncaDJbgKUUa4T+alL2L4gLv9AKGoBsjoITIMISlGl
         wCOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=2Oxt968xPFJW3/QbQOodnOToubiexBO83YjHsAXgGQ8=;
        fh=HXYDs94KzwTSsUf1O3tCI1GSm/xkj2EYYWY1hO6y3Vo=;
        b=GYQQe4GPCO9hQtZVWTHFcbDUxvmvSx+zc8cBwem8GGafamXmt2lh2PxxcsUAALQVdp
         zjDu8NSn2vW9EWQjoP0io4y1XnZtRJcgp+GFRYMDKNl3pQ5NiQe2Ya6XVJaAt3/Yw4EG
         cPp+zzdsok3RXHhDYZqlzeSzJYgsfUHQAk0P5ZRLbUMQrS+C2TMq421qhAzphzmmF9L+
         OkEiDyxf3KksoluMyPy1OM+0L4YaPJbx0tBLM7RFsl+HgYYq+1BrWBsA9eYZo00wC+vu
         hsvkGTOM2XwbFS4T9Y59mJccbdK0Getx3TbgbiPKBr8J7kh6iL3BWpXbEKyc50a+REwO
         3h5g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792533197; x=1793137997; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2Oxt968xPFJW3/QbQOodnOToubiexBO83YjHsAXgGQ8=;
        b=nSUJFN1lZPHJ/zVxC5TPBxBsbZy2sbGcjMswSvaJFs9BxAf5bkuMBioRJ5pN/GZWdM
         2GnU90EHwJ6zLbOT2Zqal7H4BQHRllCgwezpNL/VUWcUI99avjJsuicRdIWALsKBL4qj
         RGgvDMP13SuFxovjPcWbD2G1jDoLxGaVaCtq/x4hbxV3bBPiP2pTDwQPigtYQ8bdSRzY
         eKz6albsdhLV9PgJpH6aFDJVcDJHLBMNRkD74b1wjisKkA31hvFFANkVrZcCzyk2srWn
         G7wg5GGecS4rI66TN9xEa+dLNq/8WJqmtHoxSQa1gwLwxgVmOlFKmNbuZ/h/dEpPqsJr
         Z7gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792533197; x=1793137997;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=2Oxt968xPFJW3/QbQOodnOToubiexBO83YjHsAXgGQ8=;
        b=ctT7BgvWF9L7xsKyBPg8siSqaR+FG5CMiOwlNX9oB91xnR5ZFPEkH+qTwyB08ge0eq
         LeDW0KtO4thMQqf2sPFP4hZYbCHmwunl8J43rrd5MvuWdIOOBWdl1LOkYvLGmXN7jtrp
         WvcgEByCwIsN3X8KA6aT92VaDrsI6zU+eX/Q7TFKQqpk0jJvqC7wuWRX5NI1qU//ZpZi
         weeumPXcJv1LcTYbzfS/4+MoBiCDkoQ/d9pSLi93mr83DGtRGkgG2ro+0vkJW1xH+qb/
         Aum+LWDPPKfSA0kKYI+srNeQFGL0nlnUPj6oTCGrxJrSywHsI3eD/0TNTFm57xJyoA6O
         fFhA==
X-Gm-Message-State: AFq9FYIlWvUtM9V5gDYoo5RWFJePUSCWGYqPJdxSt1fjPzjFxQouZudy
	OZnxrQqLBY3ylD8uI2pyWc91TOV2zrLT63szgyfiNr0KJ7JkJIDH1tXtKrni9qLs6LOzSbr9q+D
	7sr8I1sDygVdToWnNGEzTmZ4hCBU8Q5oMVdEK8OQ=
X-Gm-Gg: AYBFou1k2Jzh9tJQOzWL9dg+iCsxJL/M9X6mo24y1PPxrzTteSRpCOPvZjzNue4dW33
	Dqx0AVmvfOr/dTZbIKkNiHfELUo9dguj9R0D6VGZfjo4z/SmIXk7m5XXAKbWiwMlY2Uq1JvBvAX
	ykAS+cfruBmi4jxjtNSTd07ZKX0CoUGB+biRcKUO6hRUkcflFE8vo909k1sZ+qcTbaFx2J2ETYU
	M6Xnd8Igz4PMIvHaG0hwARQjeBOmOXg9BYfoxQ8l9dAaesglbJlbgqJvKpzCEQG+NQMm1im/0h7
	b7EgpWSucG3KhL+iRqw2jdHCqc1W6luh59JgBBqhRe8ryes1MI4sJr+R0pWrK3x5l+4up56usx2
	UDMfUMKlVNh8gYTuhZVyn+R97dtZC3st1ZfckoUj7fK1djHqiEKGDrSCs5uCRHoCwHQHd0FEY5q
	KKKf8zLJtI5pamrplK2QWk7AV8b23Q19Ax5LuEzfs=
X-Received: by 2002:a05:690e:4845:b0:671:1b72:bd0f with SMTP id
 956f58d0204a3-67a0e4d1f88mr240730d50.58.1792533197672; Tue, 20 Oct 2026
 14:53:17 -0700 (PDT)
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: Peter Walker <peter.walker78@gmail.com>
Date: Tue, 20 Oct 2026 22:53:06 +0100
X-Gm-Features: AclHuK_Z3VAuE7-iTNq4NxLqWxkOfdm4TCisHslVnbDO3BTotysqEzSbGX6H7JA
Message-ID: <CAPv=dGA4maJEzJ1mt6udD71WFD8SbxGFfun5Hg8PpvGEb038HA@mail.gmail.com>
Subject: ucsi_acpi: "bogus connector number in CCI: 2" flood on Acer Aspire A14-61M
To: linux-usb@vger.kernel.org
Cc: heikki.krogerus@linux.intel.com
Content-Type: text/plain; charset="UTF-8"

Hello,

On an Acer Aspire A14-61M the kernel log fills with

ucsi_acpi USBC000:00: bogus connector number in CCI: 2

at 2-4 lines a second for as long as the machine is awake, about
290,000 lines a day.


System

Acer Aspire A14-61M (board Tiguan_SKF), AMD Ryzen AI 5 340
BIOS INSYDE V1.29 (03/24/2026); also seen on V1.00 (04/09/2025)
Kernel 7.2.7-ogc1.1.fc44 (Bazzite); also seen on 7.2.3 and 7.2.4
ACPI device USBC000:00 (\_SB_.UBTC), defined in DSDT and SSDT31


Where it happens

The message comes from the connector bounds check in
ucsi_notify_common(). The laptop has two USB-C ports, but the PPM
reports one connector, so only port0 is registered, and it then sends
connector change notifications for connector 2.

GET_CAPABILITY (through the ucsi debugfs command file):

0x01300300012000020000b40100000144
bmAttributes 0x00000144, bNumConnectors 1, bmOptionalFeatures 0xb4,
bNumAltModes 2, BC 1.2, PD 3.0, Type-C 1.3

GET_CONNECTOR_STATUS for connector 2 is answered without error. While
the messages are being printed it returns:

0x00000000000000010000000020004260
change 0x4260 (PDOS, POWER_LEVEL, BC, CONNECT), not connected

As soon as that command has been issued the messages stop, and reading
it again shows the change field cleared:

0x00000000000000010000000020000000


How to reproduce

1. With no messages being printed, unplug the charger.

2. About 5 seconds later the messages start. They carry on whether the
charger is plugged back in, moved to the other port or left out.

3. s2idle suspend pauses them; they start again 1-3 seconds after
resume.

4. Writing 0x20012 (GET_CONNECTOR_STATUS, connector 2) to
/sys/kernel/debug/usb/ucsi/USBC000:00/command stops them: 17 messages
in the 5 seconds before, none in the 5 seconds after. A suspend/resume
cycle afterwards did not bring them back; the next charger unplug did.


Other observations

- While the messages are being printed, port0 does not follow the
charger. GET_CONNECTOR_STATUS for connector 1 reported it connected
with a PD contract (opmode PD, sink, partner DFP, RDO 0x53851545,
change 0x4a60), while sysfs showed port0 with no partner,
power_operation_mode "default", and ucsi-source-psy-USBC000:001
online=0. Three seconds after the GET_CONNECTOR_STATUS(2) in step 4,
"UCSI_GET_PDOS failed (-70)" was logged and port0-partner, port0-cable
and port0-plug0 appeared, with power_operation_mode
"usb_power_delivery" and the power supply online=1.

- "UCSI_GET_PDOS failed (-70)" is also logged twice at probe on every
boot.

- Charger plug and unplug also arrive through acer_wmi as "Unknown
function number - 9 - 1" and "- 9 - 0".

I have the DSDT/SSDT tables, the full sysfs state and the journal, and
I'm happy to run further tests.

Thanks,
Peter
