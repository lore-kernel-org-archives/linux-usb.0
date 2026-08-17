Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB7192147E5
	for <linux-usb@vger.kernel.org>; Mon, 17 Aug 2026 09:01:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786957281; cv=none; b=T1n6L5jXSBx+MXNegFVSmgYv3QVlmNO5nYfOebRNiayQmwPlps2ki09KlfMOu5ZjjTFKS4L9Ue7l8o7zJt0Av1fYATAXJoOJmHOG2LVpqodpiB6d00kGXgu7wVwTcP+QpAWUpdJxCVKFXDkSsVj4sZUdwn1kcJa99dG8n6641Ik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786957281; c=relaxed/simple;
	bh=40pG3l4ZaTgqcIvvWo+/1VApTRlONbYb++lBWj8AKak=;
	h=Date:From:To:Cc:Subject:References:Mime-Version:Message-ID:
	 Content-Type; b=XcZ+FqbyUd/zKKPakM0pwbd5+sgOaU6T5okudgpx+SZeTHjPy2EMlcUwxHoibxrSaq+dh7DVfzQhLw+5Xkjmg3Z1dXQrcDq8xef4bFGCj9ERjCKn3qsD2hKxBzHfhkI9mPxuXE4HvinnItngkE2o8wpEnNtc09NtvqOxqpZEe0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 30b55d569a1a11f19a56ed5b684f684d-20260817
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:bdee8816-cc87-482c-9c13-995bd8b1ae24,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:7db8b62,CLOUDID:4ee841f0ce2a6c2b556c5ef456038106,BulkI
	D:nil,BulkQuantity:0,SF:81|83|102|855|865|898,TC:nil,Content:0|15|52,EDM:-
	3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,A
	V:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 30b55d569a1a11f19a56ed5b684f684d-20260817
X-User: huangwei@kylinos.cn
Received: from mywork-t480 [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <huangwei@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 1165397571; Mon, 17 Aug 2026 17:01:10 +0800
Date: Mon, 17 Aug 2026 17:01:11 +0800
Organization: =?utf-8?B?6bqS6bqf6L2v5Lu25pyJ6ZmQ5YWs5Y+4?=
From: huangwei <huangwei@kylinos.cn>
To: "Jacob Riff" <jacob@riff.dk>, 
	"Heikki Krogerus" <heikki.krogerus@linux.intel.com>
Cc: =?utf-8?B?6buE5Lyf?= <huangwei@kylinos.cn>, 
	linux-usb <linux-usb@vger.kernel.org>, 
	"Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Subject: Re: Re: [RFC PATCH] usb: typec: ucsi: retry init when the PPM answers early commands incorrectly
References: <202608171119200877083@kylinos.cn>, 
	<20260817043746.1449099-1-jacob@riff.dk>
X-Priority: 3
X-Has-Attach: no
X-Mailer: Foxmail 7.2.25.489[cn]
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Message-ID: <202608171701083146745@kylinos.cn>
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

SGkgSmFjb2IsCgpUaGFua3MgLSB0aGF0IHJlc29sdmVzIG15IGNvbmNlcm4uIEkgaGFkIG1pc3Nl
ZCB0aGF0IHRoZSAicG9zc2libGUKVUNTSSBkcml2ZXIgYnVnIiBkZXZfZXJyIGluIHVjc2lfcmVh
ZF9lcnJvcigpIGlzIHVudG91Y2hlZCBieSB5b3VyCnBhdGNoLCBzbyBmaXJzdC1vY2N1cnJlbmNl
IHZpc2liaWxpdHkgaXMgcHJlc2VydmVkIGFuZCB0aGUgYm91bmRlZApyZXRyeSBvbmx5IGRlbGF5
cyB0aGUgZmluYWwgdmVyZGljdCBieSB+MTBzLiBSZXN0cmljdGluZyB0aGUgcmV0cnkKdG8gdGhl
IHVjc2lfaW5pdF93b3JrKCkgcGF0aCBpcyBhIHJlYXNvbmFibGUgZGlzY3JpbWluYXRvciwgZ2l2
ZW4KdGhlIGVycm9yIGNvZGVzIHJlYWxseSBhcmUgaWRlbnRpY2FsIGJldHdlZW4gdGhlIHR3byBj
YXNlcy4KCk5vIGZ1cnRoZXIgY29tbWVudHMgZnJvbSBteSBzaWRlLiBHb29kIGx1Y2sgd2l0aCB0
aGUgUkZDLgoKQmVzdCByZWdhcmRzLApIdWFuZyBXZWkKCgoKCuS6jsKgMjAyNi0wOC0xN8KgMTI6
MzcswqBKYWNvYiBSaWZmwqDlhpnpgZM6wqAKCgoKT24gTW9uLCAxNyBBdWcgMjAyNiAxMToxOToy
NCArMDgwMCwgaHVhbmd3ZWkgd3JvdGU6CgoKCj4gVGhlcmUgdGhlIGNvbW1hbmRzIGRvIGNvbXBs
ZXRlLCBidXQgdGhlIEVDIHRha2VzIGxvbmdlciB0aGFuIHRoZSA1cwoKCgo+IGhhcmRjb2RlZCB3
YWl0IGluIHVjc2lfc3luY19jb250cm9sX2NvbW1vbigpLiBUaGUgZml4IGZvciB0aGF0IGNhc2Ug
aXMKCgoKPiBhbHJlYWR5IHJldmlld2VkIFsxXSAodGhhbmtzIEhlaWtraSwgRmVkb3IpLCBzbyBi
b3RoIGZhaWx1cmUgbW9kZXMgb2YKCgoKPiB0aGUgIlBQTSBub3QgcmVhZHkgZHVyaW5nIGJvb3Qi
IHdpbmRvdyB3b3VsZCBiZSBjb3ZlcmVkOgoKCgo+CgoKCj7CoMKgIC0gc2xvdyBhbnN3ZXJzwqAg
LT4gbG9uZ2VyIGNvbXBsZXRpb24gdGltZW91dCBbMV0KCgoKPsKgwqAgLSB3cm9uZyBhbnN3ZXJz
IC0+IGluaXQgcmV0cnkgKHRoaXMgUkZDKQoKCgrCoAoKCgpIaSBIdWFuZyBXZWksCgoKCsKgCgoK
ClRoYW5rcyBmb3IgdGFraW5nIGEgbG9vaywgYW5kIGdvb2QgdG8gc2VlIHRoZSB0d28gZmFpbHVy
ZSBtb2RlcyBvZgoKCgp0aGUgYm9vdCB3aW5kb3cgZW5kIHVwIHdpdGggY29tcGxlbWVudGFyeSBm
aXhlcy4KCgoKwqAKCgoKPiBPbmUgc21hbGwgcXVlc3Rpb24gb24gdGhlIC1FSU5WQUwgcmV0cnk6
IHVjc2lfcmVhZF9lcnJvcigpIGFsc28KCgoKPiByZXR1cm5zIC1FSU5WQUwgZm9yIFVDU0lfRVJS
T1JfSU5WQUxJRF9DT05fTlVNIC8gVU5SRUdPTklaRURfQ01EIC8KCgoKPiBJTlZBTElEX0NNRF9B
UkdVTUVOVCwgd2hpY2ggYXJlIGxvZ2dlZCBhcyAicG9zc2libGUgVUNTSSBkcml2ZXIgYnVnIi4K
CgoKPiBSZXRyeWluZyB0aG9zZSBpcyBoYXJtbGVzcyBpbiBwcmFjdGljZSAoZGVidWctbGV2ZWwg
bG9nZ2luZywgYm91bmRlZAoKCgo+IGF0dGVtcHRzKSwgYnV0IGl0IGRlbGF5cyB0aGUgcmVwb3J0
IG9mIGEgZ2VudWluZSBkcml2ZXIgYnVnIGZyb20gdGhlCgoKCj4gZmlyc3Qgb2NjdXJyZW5jZSB0
byB0aGUgMTAwdGguIERpZCB5b3UgY29uc2lkZXIgZGlzdGluZ3Vpc2hpbmcgdGhlCgoKCj4gUFBN
LW5vdC1yZWFkeSBjYXNlIGZyb20gdGhlIHJlYWwgZXJyb3IgY2FzZSwgb3IgaXMgdGhlIHNpbXBs
aWNpdHkgb2YKCgoKPiByZXRyeWluZyBib3RoIHdvcnRoIHRoYXQgdHJhZGUtb2ZmPwoKCgrCoAoK
CgpJIGNvbnNpZGVyZWQgaXQsIGJ1dCBieSBlcnJvciBjb2RlIHRoZSB0d28gY2FzZXMgYXJlIGlk
ZW50aWNhbC4gT24KCgoKdGhpcyBtYWNoaW5lIHRoZSBub3QtcmVhZHkgUFBNIGFuc3dlcnMgYSB2
YWxpZCBzdGFuZGFyZCBpbml0IGNvbW1hbmQKCgoKd2l0aCBVTlJFR09OSVpFRF9DTUQgLyBJTlZB
TElEX0NNRF9BUkdVTUVOVCAtIGV4YWN0bHkgdGhlIGNvZGVzCgoKCnVjc2lfcmVhZF9lcnJvcigp
IG1hcHMgdG8gInBvc3NpYmxlIFVDU0kgZHJpdmVyIGJ1ZyIuIFNvIHRoZSBvbmx5CgoKCmRpc2Ny
aW1pbmF0b3JzIGxlZnQgYXJlIGNvbnRleHQgYW5kIHBlcnNpc3RlbmNlLCB3aGljaCBpcyB3aGF0
IHRoZQoKCgpwYXRjaCByZWxpZXMgb246IHRoZSByZXRyeSBleGlzdHMgb25seSBpbiB0aGUgdWNz
aV9pbml0X3dvcmsoKSBwYXRoCgoKCihhIHJ1bnRpbWUgLUVJTlZBTCBpcyB1bmFmZmVjdGVkKSwg
dGhlIG5vdC1yZWFkeSB3aW5kb3cgaGFzIGNsZWFyZWQKCgoKYWZ0ZXIgYSBzaW5nbGUgcmV0cnkg
aW4gZXZlcnkgYm9vdCBvYnNlcnZlZCBoZXJlLCBhbmQgYSBnZW51aW5lIGJ1ZwoKCgpmYWlscyBk
ZXRlcm1pbmlzdGljYWxseSwgZXhoYXVzdHMgdGhlIGJvdW5kZWQgYXR0ZW1wdHMgKDEwMCB4IDEw
MG1zCgoKCj0gMTBzIHdpdGggdGhlIHJvbGUgc3dpdGNoIGNvbnN0YW50cykgYW5kIHN0aWxsIGVu
ZHMgaW4gdGhlIGxvdWQKCgoKIlBQTSBpbml0IGZhaWxlZCwgc3RvcCB0cnlpbmciLgoKCgrCoAoK
CgpPbiBkZWxheWluZyB0aGUgcmVwb3J0OiB0aGUgInBvc3NpYmxlIFVDU0kgZHJpdmVyIGJ1ZyIg
bWVzc2FnZSBpcwoKCgpkZXZfZXJyIGluIHVjc2lfcmVhZF9lcnJvcigpIGFuZCB0aGlzIHBhdGNo
IGRvZXMgbm90IHRvdWNoIGl0LCBzbyBpdAoKCgpzdGlsbCBmaXJlcyBvbiB0aGUgZmlyc3Qgb2Nj
dXJyZW5jZS4gV2l0aCB0aGUgcmV0cmllcyBhIGRldGVybWluaXN0aWMKCgoKYnVnIHdvdWxkIHBy
aW50IGl0IG9uIGV2ZXJ5IGF0dGVtcHQgYmVmb3JlIHRoZSBmaW5hbCBlcnJvciwgc28gdGhlCgoK
CmNvc3QgaXMgYSAxMCBzZWNvbmQgZGVsYXkgb2YgdGhlIGZpbmFsIHZlcmRpY3QgcmF0aGVyIHRo
YW4gYSBoaWRkZW4KCgoKcmVwb3J0LiBUaGF0IHNlZW1lZCBhIGZhaXIgcHJpY2UgZm9yIHJldXNp
bmcgdGhlIGV4aXN0aW5nIHJvbGUgc3dpdGNoCgoKCnJldHJ5IG1hY2hpbmVyeSB1bmNoYW5nZWQu
CgoKCsKgCgoKCkJlc3QgcmVnYXJkcywKCgoKSmFjb2IKCgoKCgoKCjIwMjYtMDgtMTcKCgoK5YWs
5Y+477ya6bqS6bqf6L2v5Lu25pyJ6ZmQ5YWs5Y+4CgoKCuWnk+WQje+8mum7hOS8nyAoRGF3YXku
SHVhbmcpCgoKCuWcsOWdgO+8muS4iua1t+W4guW+kOaxh+WMuueVquemuui3rzEwMjjlj7fmlbDl
qLHlpKfljqYxMualvAoKCgrpgq7nvJbvvJoyMDAwMzAKCgoK55S16K+d77yaMDIxLTUxMDk4ODY2
LTYwMzMKCgoK5omL5py677yaMTM4MTQ5OTY1NzUKCgoKRW1haWzvvJpodWFuZ3dlaUBreWxpbm9z
LmNuCgoK

