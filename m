Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E33BE448BA9
	for <linux-usb@vger.kernel.org>; Tue,  4 Aug 2026 13:42:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785850925; cv=none; b=rIxzltEFVlY059ZTk74BkLnCVGb0HTz2wZVVeZe4si1WAQ3b0HGFdT8TWi+7DfSOHeGn7s+XEAmohzaZ+bMtpIanE7dvX1y+y+x535bok91XKYigSBqWgOq+Kflob39RidfbK7Epx0gRFmnQpnh9+8RFBB3cSEsN8aeNuIcvT6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785850925; c=relaxed/simple;
	bh=UEzBVHoqXug9Ee158EhFmLBgB8L8Nmtmcwm9HhSC5ho=;
	h=Content-Type:Message-ID:Date:MIME-Version:Subject:To:References:
	 From:In-Reply-To; b=r5Wx7AA8JIWh/BQOnPnIJrkgt45d4qNWH+AXYbrOB8d4wxC6+kHJ3Si7kU6eCJyHJUA2STyfzSFo8NalCFQkaTGrmpyqOVq/qt423eTADv8sEXA9mAKqIj7Mi91sha5J5AZjxSalkxDPv++PDpRihgZk/Ckwe2JcIcWuBjKEvEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=FX1RMKtw; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="FX1RMKtw"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-47f703a9d05so2799480f8f.0
        for <linux-usb@vger.kernel.org>; Tue, 04 Aug 2026 06:42:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1785850921; x=1786455721; darn=vger.kernel.org;
        h=in-reply-to:from:content-language:references:to:subject:user-agent
         :mime-version:date:message-id:content-type:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UEzBVHoqXug9Ee158EhFmLBgB8L8Nmtmcwm9HhSC5ho=;
        b=FX1RMKtwEcZc7gb6PYYwNBSWShC7e/VjfeZgqgLkVzM+56KbV3O5lruvzIfrj3Q7TC
         VPMlA9igs3P1o3bxBzx8exutxIrR1VypOD5MIunasrRMuvivINanQH6NX3+kUx53LP5G
         P5H5XRPOXX0vQUH5Z2baqZrntA7R1AgvlOCkj3iwD8GUpnyChjlWNCKfAN1T1C79+q0V
         cLhG4H5aB2OftZq2UJ7m24N7A1Uc/1qSI4/EBUw/JJBK6cA4fEM4t4Hd3oNCSlTf7cNa
         mRCrAsK84wDLYp7vJutfBuR+wN/ELWB41KY62pNWSAvyGvk0fqFZQD22Rd6WSfKJVMHP
         n6Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785850921; x=1786455721;
        h=in-reply-to:from:content-language:references:to:subject:user-agent
         :mime-version:date:message-id:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UEzBVHoqXug9Ee158EhFmLBgB8L8Nmtmcwm9HhSC5ho=;
        b=A+XN/ATVQeb7JufszaQNfx0su/6QyS7NSO/dh6pv2enKtHNY1Jx5SN6oMv55QJW0re
         5k2paBIhbrYjwdn34Ls7jtR6JX8ZLiQGOwGPSlE/YNFecEygjKZvWHLknUtAHB8Rg8kW
         AJGNkfM2DBH9+z0ldhFi+BzaPCA/E474O/icjoTOX6SMb1IgTDGE2NwIdlgMpAgyBloW
         LE0qdRnmqIVPNACaCnW5JZxu8zscIPVRqLQgfiUpIu4iEyNXwFOSgUJnlurpenog4VsE
         nzxLfzad+EkKlDSTZUVbsZnQIwJoytIUZfZC1MM/KC9BCiVFeTnPj3HJjiYGaF0ZW2Xp
         JwdQ==
X-Forwarded-Encrypted: i=1; AHgh+RpsOwAiGxwG/3sbqMK9xkU+N7vyvl9M9iKr/o5bNATISQ9D6BFhlhhJBiBeMTBtNaGI2UoGd3CziGU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyQcC9VJK+9i7G6Vw6IvXEOAO6fF02xEKD2yAWTeAU3sgZJgUUA
	2qOhGR6//5y0THrAMPGQEKLxf8jKwpwMCKq3Rxt9p/Z/XMMH9QkgrRYuxI1USabe06o=
X-Gm-Gg: AR+sD12bnSWLqMLQTc6Bi0f8jnIK0eYly6wEIxyrNvFoAywXgzVJ+/YXNKs5Y70EpR+
	ykJPVy42GMWBNo0O2az4uKNQDGdGWtlnZH7zA9mZIJAMyRIUQpL+lN+71WuDIGY2ZB9RIo6dPvd
	7TLfUWgVruIs4a1zlsYU6ZPdSxLvecCzbKv0PGgL0C31R/Vps3q3pXe3MZpcjwUCGk44cRzo03A
	41XFiJH/ehwLnvMJWmPa1lpIZxdSNsZq7bRqLCdpCesb/QMmz6ikwJL2oyLPVd4YteQRCdzOO/l
	RTJ7MRXidHx3vjpdUSznlvvnH1KC9XqQRaJiNmdzi6DW2bR70plrTKN0wmjGPdb2XCkFUGaxKyi
	mENTV6KftP7ENwfDYLELWVyBImERWHuq2j3hB0PHz6iqUCzWFrecZezm37yb3YoKIWq+sGQtQZW
	YiOxQUVIrrR9ZUza18gFYsSVe5R1LfS3MXS82pTV66heH7ygvbdJW0w3eBLgaq7/jwdogRFuQZA
	PBWE8nHqgy57a2HcYvbDTx/oaPm6aRy0so=
X-Received: by 2002:a5d:6e0d:0:b0:47f:8110:3073 with SMTP id ffacd0b85a97d-47fd72e1b04mr29611567f8f.24.1785850921251;
        Tue, 04 Aug 2026 06:42:01 -0700 (PDT)
Received: from ?IPV6:2a02:3033:27e:5329:b995:77c4:eb1c:c85f? ([2a02:3033:27e:5329:b995:77c4:eb1c:c85f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd42d91b3sm46702225f8f.14.2026.08.04.06.42.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Aug 2026 06:42:00 -0700 (PDT)
Content-Type: multipart/mixed; boundary="------------ojQKWxbTuQtWTXYX1sObRijU"
Message-ID: <badd4d94-2e84-400f-bddc-c9ac8fd6e7c8@suse.com>
Date: Tue, 4 Aug 2026 15:41:59 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [syzbot] [usb?] possible deadlock in digi_set_modem_signals
To: syzbot <syzbot+2051460e19471eeb42c3@syzkaller.appspotmail.com>,
 gregkh@linuxfoundation.org, johan@kernel.org, linux-kernel@vger.kernel.org,
 linux-usb@vger.kernel.org, syzkaller-bugs@googlegroups.com
References: <6a6cd832.1aa927e4.17d4bf.0007.GAE@google.com>
Content-Language: en-US
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <6a6cd832.1aa927e4.17d4bf.0007.GAE@google.com>

This is a multi-part message in MIME format.
--------------ojQKWxbTuQtWTXYX1sObRijU
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 31.07.26 19:15, syzbot wrote:
> If you want syzbot to run the reproducer, reply with:

#syz test: git://repo/address.git 11028ab62899


--------------ojQKWxbTuQtWTXYX1sObRijU
Content-Type: text/x-patch; charset=UTF-8;
 name="0001-usb-serial-digi_accelport-annotate-spinlocks.patch"
Content-Disposition: attachment;
 filename="0001-usb-serial-digi_accelport-annotate-spinlocks.patch"
Content-Transfer-Encoding: base64

RnJvbSBjZTNjZGE1Y2M0ZGY3NDg2MDBjMzdiNmI1Y2Y1OTY0ZDIxNDc4ZTFjIE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQpGcm9tOiBPbGl2ZXIgTmV1a3VtIDxvbmV1a3VtQHN1c2UuY29t
PgpEYXRlOiBUdWUsIDQgQXVnIDIwMjYgMTE6Mzg6MzAgKzAyMDAKU3ViamVjdDogW1BBVENI
IDEvMl0gdXNiOiBzZXJpYWw6IGRpZ2lfYWNjZWxwb3J0OiBhbm5vdGF0ZSBzcGlubG9ja3MK
ClRoZSBkcml2ZXIgaG9sZHMgdHdvIHNwaW5sb2NrcyBhdCB0aGUgc2FtZSB0aW1lLgpUaGlz
IGlzIHBlcmZlY3RseSBzYWZlLCBidXQgY29uZnVzZXMgdGhlIHZhbGlkYXRvci4KVGVsbCBp
dCBtYW51YWxseSB0aGF0IHdlIGtub3cgd2hhdCB3ZSBhcmUgZG9pbmcuCgpTaWduZWQtb2Zm
LWJ5OiBPbGl2ZXIgTmV1a3VtIDxvbmV1a3VtQHN1c2UuY29tPgotLS0KIGRyaXZlcnMvdXNi
L3NlcmlhbC9kaWdpX2FjY2VsZXBvcnQuYyB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGlu
c2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvdXNiL3Nl
cmlhbC9kaWdpX2FjY2VsZXBvcnQuYyBiL2RyaXZlcnMvdXNiL3NlcmlhbC9kaWdpX2FjY2Vs
ZXBvcnQuYwppbmRleCBkZWEwMzkxNjM2NjEuLmE2ODcyMTdlYWRkNyAxMDA2NDQKLS0tIGEv
ZHJpdmVycy91c2Ivc2VyaWFsL2RpZ2lfYWNjZWxlcG9ydC5jCisrKyBiL2RyaXZlcnMvdXNi
L3NlcmlhbC9kaWdpX2FjY2VsZXBvcnQuYwpAQCAtNTIyLDcgKzUyMiw3IEBAIHN0YXRpYyBp
bnQgZGlnaV9zZXRfbW9kZW1fc2lnbmFscyhzdHJ1Y3QgdXNiX3NlcmlhbF9wb3J0ICpwb3J0
LAogCQlwb3J0X3ByaXYtPmRwX3BvcnRfbnVtLCBtb2RlbV9zaWduYWxzKTsKIAogCXNwaW5f
bG9ja19pcnFzYXZlKCZvb2JfcHJpdi0+ZHBfcG9ydF9sb2NrLCBmbGFncyk7Ci0Jc3Bpbl9s
b2NrKCZwb3J0X3ByaXYtPmRwX3BvcnRfbG9jayk7CisJc3Bpbl9sb2NrX25lc3RlZCgmcG9y
dF9wcml2LT5kcF9wb3J0X2xvY2ssIFNJTkdMRV9ERVBUSF9ORVNUSU5HKTsKIAogCXdoaWxl
IChvb2JfcHJpdi0+ZHBfd3JpdGVfdXJiX2luX3VzZSkgewogCQlzcGluX3VubG9jaygmcG9y
dF9wcml2LT5kcF9wb3J0X2xvY2spOwotLSAKMi41NS4wCgo=

--------------ojQKWxbTuQtWTXYX1sObRijU--
