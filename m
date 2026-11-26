Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795721392;
	b=SusQnLBTQY4p58+VOHrwV6NLoyl2kOAx1h4geahDoKzYHElpkD7IJcKgnNnFByb1gcAr
	 LxctCMUnfWsXny/rZAUdI3w5KKrCTDU2s1cB7nQRiAepAZKHU0M83a8ysTbSXOGXM55ch
	 JAVtp324TUKlXipI8WJn0rtrkuU+2wlvUpi7ftYR9j6g+qnnGonmszJqiJuHtWBdnqB52
	 ODz23fZOy/knWSdPwIjp4gjs35RsuFBg2y7TjJfSxBQqTYHfEbMfJpWH0l8TsBXAjuVej
	 n8R50NDV/6zRmxZb+27q9eb7j18ch6Giz6TSpPhMtV/xSRF3pZu9CVCWbljQoWKqFpA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795721392;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type;
	bh=MfbNC3zorhQtKgqD937svqEvmewdcnY2D2epbNaRiEs=;
	b=IMDViNoTmU+TM7Hgzv6IV7qMCi8NOXh00DhmeeJ8euBhQbAYRN5vBsY0U9/ryxZfwHky
	 GFweTvaySZVnR9M1Nlhu1oXZwzVrOrFrDB+RcQ+0PUiKhnHNbU8EJ6xmJI9LkqnaX9T24
	 smUtKm4Py6Nh0+Zg0BKn99YlF/9UyZ4YwuYD7Al9dNMG1UOAEI+PUO0D4rci5IrexZhq/
	 ud+CksPI5V287h4emIdRla9/+2/CrgkU23vdcQeBoHqj7haRZLN0D/wYltO0GNrBTSwav
	 hWcYZaoDPmbsemf05RziWBMkV5zR/J1h+/K9unDZfs7WqwFpb20H9lBqLRR1Syb+JEQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DNT3AXDh;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.50
Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FE56606A31E
	for <linux-usb@vger.kernel.org>; Thu, 26 Nov 2026 19:29:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8FE56606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DNT3AXDh
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-15ea896ddc8so12076863c88.0
        for <linux-usb@vger.kernel.org>; Thu, 26 Nov 2026 11:29:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795721391; cv=none;
        d=google.com; s=arc-20260327;
        b=MhFZudi19sWRHV8CK0y4tCFM3E+x9bzmrI9TSNLv/DgxtW1tjMpc30xn0MvBtcig8I
         RrmYmRs9Oh9XKzPiasWkCKfAW6QQ+jRjiG2KKXUzsNyTremrc9HnKj8YxaY36hYybyJd
         P5NDbyyJpcZ5D54mS9Avlg/5xOFNRbvMPajgydBSZOa89HPphxZdSn7IOL22AeLFwPEm
         qDMAq7WYw29jfW8JsQI1o5pygupJ4j68QJmHObZDu6UDc95Du7q144fO5wXYMw0+Ft53
         KFCHYcrrRosngEuRt2SWBzelIFJ5bFHi7aSxlAFQuA6TtIARF8PzbjyEpCef9Xdekcgw
         ejyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=MfbNC3zorhQtKgqD937svqEvmewdcnY2D2epbNaRiEs=;
        fh=6ad4WCOvnRbKc6sOcLTuyVLihA3yjpmsH+N6bxZkpzM=;
        b=Y/fc8EJ9g1884JKILOG7GBeWP4EdiDJobMGjiJXiPv/bWjo12VFQA3xZTJPwJj3SFT
         pWZ8C15yKPjHl5as2JPpkHqg20xSNescBH++ToO+dbaXhTJGrJQ/xXF+kKf0k114nNqh
         T0euDuKRu1Q3Ke5vOpAEKKQd+BkOk15javOm4ZxnWAYTX4+xqfAGSVeZdhpRbTBipZF3
         PdqX3d+iXrAvyrl7VkeI6U9PqQc0bFLH6+o+kykxlauZNRBuu0qvhoWLiV8T9xsFINiD
         XY9xEN4BldyW/eMLrG+cQQDouFogsLBMFuqywdqVt0X3JY+dFjyD5e21d4xzZ/g1jlGY
         Tulg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795721391; x=1796326191; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MfbNC3zorhQtKgqD937svqEvmewdcnY2D2epbNaRiEs=;
        b=DNT3AXDhr+/PgmWoOHFhBXQfA565r4uhmCzR+Y45pGz9EtlMCKp8SKC9MsMbPvFYD1
         x7EpkbAe6op1k34NxF8tVXc+8ApreKk1nm8Tc8OWXY993z1YPteatq/gNVLRaMge56wz
         5q4/YQhVLkRB6Zl9xTaR1jjKJFhSx5EBgf0gei9xTp6VckO5AMv4PIVdNFfkOMTjCIM+
         uBRyEv//wgpEvYT4XQq5GfOuoKNchD3clGZrGmZa7CDluNK5ccAKCmQJkLSHmPB04S30
         hW9yojSG4qF2tpH9xax5SjJTFizxVjWXpr306vd7I2KRfYvvhffcr78mPNhnOPUVgGt1
         XFCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795721391; x=1796326191;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=MfbNC3zorhQtKgqD937svqEvmewdcnY2D2epbNaRiEs=;
        b=R3UuXh3FaH7Ub4DF6Usl73wSLOVZMk0z4hcnqjkUbwCSqmRO3e3jb3Lk5HFP5vM+u6
         NVugzIQHGW8SAMogO+co5o1cv6FWdXmSuVsIEcP68B7pICFZa/wVxdcc3YcA3EoQG7tE
         0evsQ337yZVo21zKf6nezDj0OexnjuL3AreEGEh9q1jgkbefZpWgTiN18h1wZ/x2meId
         MUh1CYFuVmpzJIb6UUJl8GZEhxMdGGOUCje5573VfzU0i4UOKpxKrTXvMNZMi9dHG3UJ
         w/o7gs6v0bYIwOpmOWMjh8AUqbbmqe5G/hXUU0FYzl4XqM3mlXN24vLukte+CcJwCTHe
         Z+xg==
X-Gm-Message-State: APuU4Z+olBKB6y0ebNFAD1IbiTx4jzlgSmirjrFDLW/iP2uoYE2GU35H
	CRsZfas3LmSrVlp+cl8Q2gSc4oZGhZxzrRNT3w5LzDwpR9IBfrfKY8oWjPpLso5twQPyr5zAEon
	RAFngOArSGBiOm5sCneRokH6DHgNhxs9L9QiPvsw=
X-Gm-Gg: AZFdTZc/2FmAjvgpg7wrJh42qy37r9x19GoSqTY9CK+IfzULas9SxX7FMexcf6cjZzd
	tPdn1OBHkqDZKqyqgsDP39gTQ/fDOpSqzVNzoGKdp5kc+vlrov5EobSSgOm9KhUn+WUBnwCTOMN
	khCilsgUMNpV7Fc9Rsk31yL82zXq2Tefc8FtSwwhjP+UEDC6Dh1WbKNGASLIC+LpBjIMQ7EWtwW
	5oY/n78ZxCn4Rm3erQ1XVfrfZ+HXC/6lOEJQKkJ1XDt+rcQgBhRkQbNrfjsCmT6235BQQ8kgmRt
	gwfKZhmeVlP9W2UbgZGcDWwbzSX7cZsX3ESjprY572MtX3Js2qi60o70emy/SHQQAwTl8rGyK6k
	cJVIPH93bge/115xoVh23ejGP19ITN6FJsbdAvpYFgaF0F4HuP29tAHQE+X750/YNTuDe
X-Received: by 2002:a05:701b:4502:10b0:1b5:3616:5968 with SMTP id
 a92af1059eb24-1b556898b59mr22458833c88.14.1795721390498; Thu, 26 Nov 2026
 11:29:50 -0800 (PST)
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: Felipe Infante de Castro <felipe.infante.de.castro@gmail.com>
Date: Thu, 26 Nov 2026 14:29:38 -0500
X-Gm-Features: Aa3M54o0o2qXZKaoa-MmzOYZbFi-gSbmMr04qjyvfTsxEmzaTFsxa9G6bpc80xE
Message-ID: <CADy1qsYCggH1S=yVEQ44mj0WVr=WimiXLDMk-zyr5KZXVG8SLQ@mail.gmail.com>
Subject: [PATCH] usb: dwc3: qcom: Restore DP/DM wake IRQ trigger types on unbind
To: Thinh.Nguyen@synopsys.com, gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: multipart/mixed; boundary="000000000000993c3e066132f7e9"

--000000000000993c3e066132f7e9
Content-Type: text/plain; charset="UTF-8"

Hi,

The patch is attached as a file rather than inline, because my mail
client cannot send it inline without wrapping lines and converting
tabs. Apologies for that. The commit message is repeated below for
review.

On suspend, dwc3_qcom_enable_wakeup_irq() sets the DP and DM
high-speed PHY interrupts to a single edge, chosen from the speed of
the attached device. The IRQ mapping outlives the driver, so after an
unbind the mapping keeps that single-edge type.

On the next probe the interrupt is looked up again from the device
tree, which describes it as IRQ_TYPE_EDGE_BOTH. The lookup fails with
a trigger type mismatch against the existing mapping. Because the wake
interrupts are optional, probe still succeeds, but without the DP/DM
wake handlers, and USB wakeup is lost until the next boot.

The patch records the trigger type of each DP/DM interrupt when it is
requested and restores it from a devres action. The action is
registered after the interrupts, so it runs while the driver still
owns them. Unmapped interrupts, unspecified types and types that
already match are left alone.

Seen on a Microsoft Surface Laptop 7 (x1e80100-microsoft-romulus15) on
a 7.3 kernel: after unbinding and rebinding a controller the
dp_hs_phy_irq and dm_hs_phy_irq handlers were absent from
/proc/interrupts. With the patch, a runtime suspend and resume
followed by an unbind and rebind kept all three wake handlers, with no
trigger mismatch in the log. The patch is against mainline; it was run
on 7.3 and build-tested on 7.3.6 with W=1, not on mainline itself.

Thanks,
Felipe

--000000000000993c3e066132f7e9
Content-Type: text/x-patch; charset="US-ASCII"; 
	name="0001-usb-dwc3-qcom-Restore-DP-DM-wake-IRQ-trigger-types-o.patch"
Content-Disposition: attachment; 
	filename="0001-usb-dwc3-qcom-Restore-DP-DM-wake-IRQ-trigger-types-o.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_mwxy4zwk0>
X-Attachment-Id: f_mwxy4zwk0

RnJvbSBlYmQ1MDZhODRkM2MyMmIzZmYyNmFhMjY5NjBhNDYzNTE5ZjliMWNlIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBGZWxpcGUgSW5mYW50ZSBkZSBDYXN0cm8gPGZlbGlwZS5pbmZh
bnRlLmRlLmNhc3Ryb0BnbWFpbC5jb20+CkRhdGU6IFRodSwgMjYgTm92IDIwMjYgMTM6NTQ6MDEg
LTA1MDAKU3ViamVjdDogW1BBVENIXSB1c2I6IGR3YzM6IHFjb206IFJlc3RvcmUgRFAvRE0gd2Fr
ZSBJUlEgdHJpZ2dlciB0eXBlcyBvbgogdW5iaW5kCgpPbiBzdXNwZW5kLCBkd2MzX3Fjb21fZW5h
YmxlX3dha2V1cF9pcnEoKSBzZXRzIHRoZSBEUCBhbmQgRE0gaGlnaC1zcGVlZApQSFkgaW50ZXJy
dXB0cyB0byBhIHNpbmdsZSBlZGdlLCBjaG9zZW4gZnJvbSB0aGUgc3BlZWQgb2YgdGhlIGF0dGFj
aGVkCmRldmljZS4gVGhlIElSUSBtYXBwaW5nIG91dGxpdmVzIHRoZSBkcml2ZXIsIHNvIGFmdGVy
IGFuIHVuYmluZCB0aGUKbWFwcGluZyBrZWVwcyB0aGF0IHNpbmdsZS1lZGdlIHR5cGUuCgpPbiB0
aGUgbmV4dCBwcm9iZSB0aGUgaW50ZXJydXB0IGlzIGxvb2tlZCB1cCBhZ2FpbiBmcm9tIHRoZSBk
ZXZpY2UgdHJlZSwKd2hpY2ggZGVzY3JpYmVzIGl0IGFzIElSUV9UWVBFX0VER0VfQk9USC4gVGhl
IGxvb2t1cCBmYWlscyB3aXRoIGEKdHJpZ2dlciB0eXBlIG1pc21hdGNoIGFnYWluc3QgdGhlIGV4
aXN0aW5nIG1hcHBpbmcuIEJlY2F1c2UgdGhlIHdha2UKaW50ZXJydXB0cyBhcmUgb3B0aW9uYWws
IHByb2JlIHN0aWxsIHN1Y2NlZWRzLCBidXQgd2l0aG91dCB0aGUgRFAvRE0Kd2FrZSBoYW5kbGVy
cywgYW5kIFVTQiB3YWtldXAgaXMgbG9zdCB1bnRpbCB0aGUgbmV4dCBib290LgoKUmVjb3JkIHRo
ZSB0cmlnZ2VyIHR5cGUgb2YgZWFjaCBEUC9ETSBpbnRlcnJ1cHQgd2hlbiBpdCBpcyByZXF1ZXN0
ZWQgYW5kCnJlc3RvcmUgaXQgZnJvbSBhIGRldnJlcyBhY3Rpb24uIFRoZSBhY3Rpb24gaXMgcmVn
aXN0ZXJlZCBhZnRlciB0aGUKaW50ZXJydXB0cywgc28gaXQgcnVucyB3aGlsZSB0aGUgZHJpdmVy
IHN0aWxsIG93bnMgdGhlbS4gVW5tYXBwZWQKaW50ZXJydXB0cywgdW5zcGVjaWZpZWQgdHlwZXMg
YW5kIHR5cGVzIHRoYXQgYWxyZWFkeSBtYXRjaCBhcmUgbGVmdAphbG9uZS4KClNlZW4gb24gYSBN
aWNyb3NvZnQgU3VyZmFjZSBMYXB0b3AgNyAoeDFlODAxMDAtbWljcm9zb2Z0LXJvbXVsdXMxNSkg
b24gYQo3LjMga2VybmVsOiBhZnRlciB1bmJpbmRpbmcgYW5kIHJlYmluZGluZyBhIGNvbnRyb2xs
ZXIgdGhlIGRwX2hzX3BoeV9pcnEKYW5kIGRtX2hzX3BoeV9pcnEgaGFuZGxlcnMgd2VyZSBhYnNl
bnQgZnJvbSAvcHJvYy9pbnRlcnJ1cHRzLiBXaXRoIHRoaXMKY2hhbmdlIHRoZXkgcmV0dXJuIG9u
IGV2ZXJ5IHJlYmluZC4KCkFzc2lzdGVkLWJ5OiBPcGVuQUkgQ29kZXgKQXNzaXN0ZWQtYnk6IENs
YXVkZSBGYWJsZSA1LjIKU2lnbmVkLW9mZi1ieTogRmVsaXBlIEluZmFudGUgZGUgQ2FzdHJvIDxm
ZWxpcGUuaW5mYW50ZS5kZS5jYXN0cm9AZ21haWwuY29tPgotLS0KIGRyaXZlcnMvdXNiL2R3YzMv
ZHdjMy1xY29tLmMgfCAzOCArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKy0KIDEg
ZmlsZSBjaGFuZ2VkLCAzNyBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0
IGEvZHJpdmVycy91c2IvZHdjMy9kd2MzLXFjb20uYyBiL2RyaXZlcnMvdXNiL2R3YzMvZHdjMy1x
Y29tLmMKaW5kZXggYTI2MDg0MS4uMzM5MmE1YiAxMDA2NDQKLS0tIGEvZHJpdmVycy91c2IvZHdj
My9kd2MzLXFjb20uYworKysgYi9kcml2ZXJzL3VzYi9kd2MzL2R3YzMtcWNvbS5jCkBAIC02NSw2
ICs2NSw4IEBAIHN0cnVjdCBkd2MzX3Fjb21fcG9ydCB7CiAJaW50CQkJZHBfaHNfcGh5X2lycTsK
IAlpbnQJCQlkbV9oc19waHlfaXJxOwogCWludAkJCXNzX3BoeV9pcnE7CisJdW5zaWduZWQgaW50
CQlkcF9oc19pcnFfdHlwZTsKKwl1bnNpZ25lZCBpbnQJCWRtX2hzX2lycV90eXBlOwogCWVudW0g
dXNiX2RldmljZV9zcGVlZAl1c2IyX3NwZWVkOwogfTsKIApAQCAtNDczLDYgKzQ3NSw3IEBAIHN0
YXRpYyBpbnQgZHdjM19xY29tX3NldHVwX3BvcnRfaXJxKHN0cnVjdCBkd2MzX3Fjb20gKnFjb20s
CiAJCWlmIChyZXQpCiAJCQlyZXR1cm4gcmV0OwogCQlxY29tLT5wb3J0c1twb3J0X2luZGV4XS5k
cF9oc19waHlfaXJxID0gaXJxOworCQlxY29tLT5wb3J0c1twb3J0X2luZGV4XS5kcF9oc19pcnFf
dHlwZSA9IGlycV9nZXRfdHJpZ2dlcl90eXBlKGlycSk7CiAJfQogCiAJaWYgKGlzX211bHRpcG9y
dCkKQEAgLTQ4OCw2ICs0OTEsNyBAQCBzdGF0aWMgaW50IGR3YzNfcWNvbV9zZXR1cF9wb3J0X2ly
cShzdHJ1Y3QgZHdjM19xY29tICpxY29tLAogCQlpZiAocmV0KQogCQkJcmV0dXJuIHJldDsKIAkJ
cWNvbS0+cG9ydHNbcG9ydF9pbmRleF0uZG1faHNfcGh5X2lycSA9IGlycTsKKwkJcWNvbS0+cG9y
dHNbcG9ydF9pbmRleF0uZG1faHNfaXJxX3R5cGUgPSBpcnFfZ2V0X3RyaWdnZXJfdHlwZShpcnEp
OwogCX0KIAogCWlmIChpc19tdWx0aXBvcnQpCkBAIC01NDAsNiArNTQ0LDM4IEBAIHN0YXRpYyBp
bnQgZHdjM19xY29tX2ZpbmRfbnVtX3BvcnRzKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYp
CiAJcmV0dXJuIERXQzNfUUNPTV9NQVhfUE9SVFM7CiB9CiAKK3N0YXRpYyB2b2lkIGR3YzNfcWNv
bV9yZXN0b3JlX2lycV90eXBlKHN0cnVjdCBkZXZpY2UgKmRldiwgaW50IGlycSwgdW5zaWduZWQg
aW50IHR5cGUpCit7CisJaW50IHJldDsKKworCWlmICghaXJxIHx8ICF0eXBlIHx8IGlycV9nZXRf
dHJpZ2dlcl90eXBlKGlycSkgPT0gdHlwZSkKKwkJcmV0dXJuOworCisJcmV0ID0gaXJxX3NldF9p
cnFfdHlwZShpcnEsIHR5cGUpOworCWlmIChyZXQpCisJCWRldl93YXJuKGRldiwgImZhaWxlZCB0
byByZXN0b3JlIElSUSAlZCB0cmlnZ2VyIHR5cGUgJSN4OiAlZFxuIiwKKwkJCSBpcnEsIHR5cGUs
IHJldCk7Cit9CisKK3N0YXRpYyB2b2lkIGR3YzNfcWNvbV9yZXN0b3JlX3dha2VfaXJxX3R5cGVz
KHZvaWQgKmRhdGEpCit7CisJc3RydWN0IGR3YzNfcWNvbSAqcWNvbSA9IGRhdGE7CisJaW50IGk7
CisKKwkvKgorCSAqIFRoZSBJUlEgbWFwcGluZ3Mgc3Vydml2ZSB1bmJpbmQuIFB1dCB0aGVpciBm
aXJtd2FyZSB0cmlnZ2VycyBiYWNrCisJICogYmVmb3JlIGRldnJlcyBmcmVlcyB0aGUgaGFuZGxl
cnMgb3IgdGhlIG5leHQgcHJvYmUgY2FuIGxvc2UgdGhlbS4KKwkgKi8KKwlmb3IgKGkgPSAwOyBp
IDwgcWNvbS0+bnVtX3BvcnRzOyBpKyspIHsKKwkJc3RydWN0IGR3YzNfcWNvbV9wb3J0ICpwb3J0
ID0gJnFjb20tPnBvcnRzW2ldOworCisJCWR3YzNfcWNvbV9yZXN0b3JlX2lycV90eXBlKHFjb20t
PmRldiwgcG9ydC0+ZHBfaHNfcGh5X2lycSwKKwkJCQkJICAgcG9ydC0+ZHBfaHNfaXJxX3R5cGUp
OworCQlkd2MzX3Fjb21fcmVzdG9yZV9pcnFfdHlwZShxY29tLT5kZXYsIHBvcnQtPmRtX2hzX3Bo
eV9pcnEsCisJCQkJCSAgIHBvcnQtPmRtX2hzX2lycV90eXBlKTsKKwl9Cit9CisKIHN0YXRpYyBp
bnQgZHdjM19xY29tX3NldHVwX2lycShzdHJ1Y3QgZHdjM19xY29tICpxY29tLCBzdHJ1Y3QgcGxh
dGZvcm1fZGV2aWNlICpwZGV2KQogewogCWJvb2wgaXNfbXVsdGlwb3J0OwpAQCAtNTU1LDcgKzU5
MSw3IEBAIHN0YXRpYyBpbnQgZHdjM19xY29tX3NldHVwX2lycShzdHJ1Y3QgZHdjM19xY29tICpx
Y29tLCBzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwCiAJCQlyZXR1cm4gcmV0OwogCX0KIAotCXJl
dHVybiAwOworCXJldHVybiBkZXZtX2FkZF9hY3Rpb25fb3JfcmVzZXQocWNvbS0+ZGV2LCBkd2Mz
X3Fjb21fcmVzdG9yZV93YWtlX2lycV90eXBlcywgcWNvbSk7CiB9CiAKIHN0YXRpYyB2b2lkIGR3
YzNfcWNvbV9zZXRfcm9sZV9ub3RpZmllcihzdHJ1Y3QgZHdjMyAqZHdjLCBlbnVtIHVzYl9yb2xl
IG5leHRfcm9sZSkKLS0gCjIuNTYuMQoK
--000000000000993c3e066132f7e9--
