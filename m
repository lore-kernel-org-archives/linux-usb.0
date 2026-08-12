Received: from out162-62-57-137.mail.qq.com (out162-62-57-137.mail.qq.com [162.62.57.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4861222E3E9;
	Wed, 12 Aug 2026 00:09:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.62.57.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786493402; cv=none; b=EvOm4GyfActdl4WCXkOz5CFdCHBH86Nmyr5td9ipdj1KX89K+jQ4eZeIKnwucJfp8HbMeacsKeymKyq7xnn7Ofa8jv3O97HnWrPh/cYP8+Tl45gm4Hy1szeoHZv2KussqYgBq9cptqetwmnqiE1DbDLIU2wsjSXDflKq/nwT2Zk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786493402; c=relaxed/simple;
	bh=4BIXfyY8ouC+eYsan5ZZ8fW5j6pXpyvyKQVfmP72EjM=;
	h=From:To:Cc:Subject:Mime-Version:Content-Type:Date:Message-ID; b=u9Y+qrLaCbT1m4ShZ7Jb29qDht3dyM1tR7p7SFyy6r2X0jd7Gqf7mfKS2AiHIQDzFVcrro3M+W64oNrTnsvq5lyttjwO29Ha2RFymrv8f5n+Y3Z7hTtFHA7q4M84oZ28rmCzUzMp2yR6+K2q+1tqDzXSciCMJPzrLyXPwUT1AyY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=MKVCpHjn; arc=none smtp.client-ip=162.62.57.137
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="MKVCpHjn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1786493389; bh=4BIXfyY8ouC+eYsan5ZZ8fW5j6pXpyvyKQVfmP72EjM=;
	h=From:To:Cc:Subject:Date;
	b=MKVCpHjnvzjllcRIl40QmUYno/xhnMzJt6eJWH4LbNV+y9F9qNfR9jxMu056Ug2OD
	 AHGO3dcxSmkLu+/BHuMxbrXp4A9MEZWXcTE6Cfrsl8R3iAmWr8Wf0ubJBzcxrQ/wiZ
	 fT/Qx3njL74u3uxumtW9+y3OPdscCSPJpxVR/urE=
X-QQ-XMRINFO: MSVp+SPm3vtSI1QTLgDHQqIV1w2oNKDqfg==
X-QQ-XMAILINFO: OPDQNGCUQ3qLg9A8CdzGGDJdasTEH9BTJk/PJGZdS6NWzDGhkOfCIFiRDC0N6C
	 IX/qzIMMDTVl+QUVo2XAD4LE8d5FA7keFJAA+w0ORU0Snt6qgWGGkGP55NLYRwch7OhOGUhx7T9k8
	 oGANW34HQLsG8KsaGCFBw/LoD2NpOOnuB2Kb9CWHqlRRmcKYliFKJho/LEU8ZHvoEaT51FoWvAb3Q
	 KBlEA8xXCpM1yukHSTSYTDvv/+PWEt3OeE0k4WZNQa8wfvaFVgG4ZxUAmeW0LX9/gePIw/QjCtjGH
	 5eslyYQvtWzB9PgWblMkf21vX12sDELiAaFTPS9o8cCoUHqkbEgOOlFcaWfxn8h4Dzknkv+wBTlQf
	 SMwbE8nl7uf1dOTv15oBYkCC1eOJYNPj219/GhZQE+9mGjvT2h2ftaF3Kkc/W5pxj/IsUXmdH33Od
	 Rn9MO742fp7T2tcfEJ3MrAUB11UjZvm2JyI0uWiQmbytO/o8/F3erEYHjEKws1o23UredhvssRjyY
	 BY4IduiW8iwIBdZqGiif2nEMpjClNps2qlolQKG0aq6bXhKwdRpG01YQaM08qJV9UAHa6xVQICdB0
	 1+VxBWqa/YKc8BqCnd7qageebsKJGrB1KoFNEfhVYgTddr7Ewqun2lqpMdG2yzZe2KLAgPasPwLGO
	 4vdvIiWk5NUlzvOtkmUHdr0yiY5yBri3/+yxww+yeLdKF8g6fD1oA6Jt6hMXbINVkiJvsv/s0WltI
	 bSK8i93oUHQbDEj4zp5pHgC6aHbfRh6eljdeG0HlHrQPXcpRzpkkyJEduOEsCBvjc0e/lqNhrxTGG
	 aj44bCbzaaJ0t9IcypKMb7jpXA5Dsm3QshSfRFFfHxvJ813l1s85Jxs4/kND7XfZObIhTlKXIARdp
	 AUJx23nGXGvL9Zhx1dzSSEgSO474Ym+9H3jiJHyzcUWAIA4Yx637Zf3aSCXtTjkwhk9i3TeWtFgMB
	 UyqWMGZTgo7k+V1gpUATlwY6n6iRqSpsqr1PKO6zs0x24zjupOpIn+DboGJuFk+iGf2oTakYmeCvq
	 gnme1ROo9qBI8geRWiKpbbEtxSQ==
From: "=?utf-8?B?cmVhbHNzbA==?=" <realsll826@qq.com>
To: "=?utf-8?B?emh1eWluYm8=?=" <zhuyinbo@loongson.cn>, "=?utf-8?B?cm9iaA==?=" <robh@kernel.org>
Cc: "=?utf-8?B?bGludXgtdXNi?=" <linux-usb@vger.kernel.org>, "=?utf-8?B?bGludXgta2VybmVs?=" <linux-kernel@vger.kernel.org>
Subject: [BUG] usb: dwc2: Unsafe PCI fallback in dwc2_init_params may crash on non-PCI platforms
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64
Date: Wed, 12 Aug 2026 08:09:47 +0800
X-Priority: 3
Message-ID: <tencent_49C5A1C04E85656D38169147438090EF3B0A@qq.com>
X-QQ-MIME: TCMime 1.0 by Tencent
X-Mailer: QQMail 2.x
X-QQ-Mailer: QQMail 2.x
X-QQ-mid: xmsezc57-0t1786493387tdadh64w5

RGVhciBZaW5ibyBaaHUgYW5kIFJvYiBIZXJyaW5nLAoKSSBob3BlIHlvdSBhcmUgd2VsbC4K
CldoaWxlIHJldmlld2luZyB0aGUgRFdDMiBkcml2ZXIsIEkgbm90aWNlZCBhIHBvdGVudGlh
bCBjcmFzaCByaXNrIGluIHRoZcKgCmBkd2MyX2luaXRfcGFyYW1zYCBmdW5jdGlvbiAoZHJp
dmVycy91c2IvZHdjMi9wYXJhbXMuYyksIGludHJvZHVjZWQgYnkgdGhlwqAKY29tYmluYXRp
b24gb2YgeW91ciB0d28gcGF0Y2hlczoKCi0gWWluYm8ncyBQQ0kgc3VwcG9ydCBwYXRjaCAo
d2hpY2ggYWRkZWQgYHBjaV9tYXRjaF9pZGAgaW5zaWRlIHBhcmFtcy5jKQotIFJvYidzIHN1
YnNlcXVlbnQgcGF0Y2ggdGhhdCByZXBsYWNlZCBgb2ZfbWF0Y2hfZGV2aWNlYCB3aXRowqAK
wqDCoGBkZXZpY2VfZ2V0X21hdGNoX2RhdGFgIGJ1dCByZXRhaW5lZCB0aGUgUENJIGZhbGxi
YWNrIHBhdGguCgpUaGUgY3VycmVudCBjb2RlIGxvb2tzIGxpa2UgdGhpcyAoc2ltcGxpZmll
ZCk6CgrCoMKgIMKgc2V0X3BhcmFtcyA9IGRldmljZV9nZXRfbWF0Y2hfZGF0YShoc290Zy0+
ZGV2KTsKwqDCoCDCoGlmIChzZXRfcGFyYW1zKSB7CsKgwqAgwqAgwqAgwqBzZXRfcGFyYW1z
KGhzb3RnKTsKwqDCoCDCoH0gZWxzZSB7CsKgwqAgwqAgwqAgwqBjb25zdCBzdHJ1Y3QgcGNp
X2RldmljZV9pZCAqcG1hdGNoID0KwqDCoCDCoCDCoCDCoCDCoCDCoHBjaV9tYXRjaF9pZChk
d2MyX3BjaV9pZHMsIHRvX3BjaV9kZXYoaHNvdGctPmRldi0+cGFyZW50KSk7CsKgwqAgwqAg
wqAgwqBpZiAocG1hdGNoICYmIHBtYXRjaC0+ZHJpdmVyX2RhdGEpIHsKwqDCoCDCoCDCoCDC
oCDCoCDCoHNldF9wYXJhbXMgPSAoc2V0X3BhcmFtc19jYilwbWF0Y2gtPmRyaXZlcl9kYXRh
OwrCoMKgIMKgIMKgIMKgIMKgIMKgc2V0X3BhcmFtcyhoc290Zyk7CsKgwqAgwqAgwqAgwqB9
CsKgwqAgwqB9CgpUaGlzIGRlc2lnbiBoYXMgb25lIGNyaXRpY2FsIGlzc3VlOgoKMS4gKipS
ZWFsIGNyYXNoIG9uIG5vbi1QQ0kgcGxhdGZvcm1zKiog4oCTIElmIHRoZSBkZXZpY2UgaXMg
bm90IGEgUENJIGRldmljZQrCoMKgIChlLmcuLCBwbGF0Zm9ybS9EVCBvciBBQ1BJKSBhbmQg
YGRldmljZV9nZXRfbWF0Y2hfZGF0YSgpYCByZXR1cm5zIE5VTEwKwqDCoCAobWlzc2luZyBt
YXRjaCBlbnRyeSksIHRoZSBjb2RlIGZhbGxzIGJhY2sgdG8gdGhlIFBDSSBwYXRoLiBJdCB0
aGVuIGNhbGxzCsKgwqAgYHRvX3BjaV9kZXYoaHNvdGctPmRldi0+cGFyZW50KWAgb24gYSBu
b24tUENJIHBhcmVudCBkZXZpY2UsIHJlc3VsdGluZyBpbiBhCsKgwqAgd2lsZCBwb2ludGVy
LiBTdWJzZXF1ZW50IGBwY2lfbWF0Y2hfaWRgIGFuZCB0aGUgZnVuY3Rpb24tcG9pbnRlciBj
YWxsIHdpbGwKwqDCoCBhY2Nlc3MgaW52YWxpZCBtZW1vcnksIGxlYWRpbmcgdG8gYW4gYFVu
YWJsZSB0byBoYW5kbGUga2VybmVsIHBhZ2luZyByZXF1ZXN0YArCoMKgIGFuZCBzeXN0ZW0g
Y3Jhc2guCgpUaGlzIGNhbiBiZSB0cmlnZ2VyZWQgb24gbWFueSBBUk0vUklTQy1WIGJvYXJk
cyB1c2luZyBEV0MyIGFzIGEgcGxhdGZvcm0gZGV2aWNlLAplc3BlY2lhbGx5IGlmIHRoZSBk
ZXZpY2UgdHJlZSBpcyBtaXNzaW5nIGEgbWF0Y2hpbmcgY29tcGF0aWJsZSBvciB0aGUgZHJp
dmVyCmRhdGEgaXMgbm90IHByb3Blcmx5IHNldC4KCkNvdWxkIHlvdSBwbGVhc2UgY29tbWVu
dCBvbiB3aGV0aGVyIHlvdSBoYXZlIHBsYW5zIHRvIGZpeCB0aGlzPyBJIGJlbGlldmUgdGhl
CnByb3BlciBzb2x1dGlvbiBpcyB0byBtb3ZlIHRoZSBQQ0ktc3BlY2lmaWMgbWF0Y2hpbmcg
bG9naWMgb3V0IG9mIHRoZSBjb3JlCmBwYXJhbXMuY2AgYW5kIGludG8gYGR3YzJfcGNpLmNg
LCB3aGVyZSB0aGUgcHJvYmUgZnVuY3Rpb24gY2FuIGV4cGxpY2l0bHkgc2V0CnRoZSBwYXJh
bWV0ZXJzLiBUaGUgY29yZSBzaG91bGQgb25seSByZWx5IG9uIGBkZXZpY2VfZ2V0X21hdGNo
X2RhdGEoKWAgYW5kIGZhbGwKYmFjayB0byBzYWZlIGRlZmF1bHRzIG9yIHJldHVybiBhbiBl
cnJvci4KClRoYW5rIHlvdSBmb3IgeW91ciB0aW1lIGFuZCBmb3IgeW91ciBjb250cmlidXRp
b25zIHRvIHRoZSBrZXJuZWwuIEkgbG9vawpmb3J3YXJkIHRvIHlvdXIgcmVzcG9uc2UuCgpC
UnMubGlhbmdsaWFuZy4KVGhhbmtzLgoK

