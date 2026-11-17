Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794923306;
	b=s+CXca1YiDWGCXIopaoFudI3TlQ8VEDL5XvbogYW/Ki9KcC/3i1FOc5e+86CiFg0yesu
	 nkLLOvGWLGCvcSILNKCMmeMMZn8RhVLBIN2/9z1llsJtXMOdaGLsljk7sZGAEgq4EBhzU
	 tNI5tXxl2iZSkVDcJXjsTC73o/bwy5IUVEDHZqh6mFtewhhPvlUBIaVg8J3vwCRaQRd/Q
	 d+ZkUAlJSIfqFb6bHi+3gudFfsk7cifMDz/SCFaRDE9qtwlv2/i0tB2RX+R9jep9PIveS
	 49JAY+heX5MC/CTGKWDI5bUOja9pZQPQJp5B8766/2RC4I+hDH9M90uTexxX7NpEcgA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794923306;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:To:
	 Cc:X-Mailer:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=GE31aG73uaCXMFbWUeiAs+bBtV2hTyeB/8Pr5Ulpk/s=;
	b=cosz/mS/EMg9JMtzKZg3ZYgpAJkUV9icxVnPC9Qw0yXKopBy/Yd3TBe7fof9dATJLoNw
	 5202CkUjxURgrYXZvwZ6EzJguELPeN0dlPYobzvTLi7frQIfOIPZjh5anDrEJq9U5udgZ
	 g9ZgfprZ5I33z8wxo5AmnQ27TkIeie34SZUYQ0xSpCekWyfnIWGKOMvaud97CCgsERRA8
	 OSQLbtMplWigr4uylqr+fqAiSKim0RSEwC7w2TRNlN7djOFBpGoHYXYV/ZO3J9GoSIjdF
	 JwD67mD8RhoJyeAzf7Az6HbMpEaZ3ATb3vlLjzsH/TfuNw9YUNuQ0mRlpCXU8rFX6Ng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ny6+YOyO;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GUbWOVkR;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F5E9606A329
	for <linux-usb@vger.kernel.org>; Tue, 17 Nov 2026 13:48:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5F5E9606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ny6+YOyO;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GUbWOVkR
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AHC0qHs3047897
	for <linux-usb@vger.kernel.org>; Tue, 17 Nov 2026 13:48:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=GE31aG73uaCXMFbWUeiAs+
	bBtV2hTyeB/8Pr5Ulpk/s=; b=ny6+YOyOmQRpg7+p82AWNdoebYDreSTHBLzHH+
	XBmJ9FcOb5eDQrxxzbbDAcwzcfdKb//HdqTfFL0vCnh34KWzjPXj0sMfJwEPzCEU
	h1c1I0eSmILURb5sJHHQnTyvntY6fxCGndqPppdZh7u0TLgrGbTicCmORRo8RfbT
	TTtgtWSXiKyC8WMhevCBmBPhtLo9PqLUpQeeDlXoNSY8+wQEXmsrLa3NTEkGuZ5k
	P9YMSW/oEVoKK1swvVP6riwZj4DduOxfNEFSifLDAO0/kTV/uW9WIyQt1V6vZ5QW
	JUjpwNMDCdflNlp2S0oslQrXQW3Zq+QgmV/YskEB6AqxYohw==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0mv10uj6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Tue, 17 Nov 2026 13:48:25 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-14373747468so2170963c88.1
        for <linux-usb@vger.kernel.org>; Tue, 17 Nov 2026 05:48:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794923305; x=1795528105; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=GE31aG73uaCXMFbWUeiAs+bBtV2hTyeB/8Pr5Ulpk/s=;
        b=GUbWOVkR793tbUqpeiHeEOsb8xPFuaDHP/X190SY5m+G+0QtRugJv0zcyIgADXK0Jx
         MhodeGUhgQaRiqcyhvoeGOQ3Q1BgeZD9JHo5OSODRJ4VqSSrfLhVQh24QWwSoE090K4Y
         /aRJ+gY9xMIFTI/LnQGeFtE838laA3qhz24FWfxQOhoIRf3oqCsRSmwOQ+jVZegNsiMc
         qqPHleRuzDXRLKE4/sXRCE6ulYH5jOewsBl/+Pq3WUuewf9H2icDxBnY++FD5qc39cNJ
         w1+6+/ZnV3UOx5SmU0bVfN8YRz5wcQ+gLiUDKr4NQP5mZQlJ+cLEh+0OdRuk2wbC4rBH
         IvXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794923305; x=1795528105;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=GE31aG73uaCXMFbWUeiAs+bBtV2hTyeB/8Pr5Ulpk/s=;
        b=odNzxcpj/A8HrukFTzigo/0+v7ho9rleuSnAnN+epYViokWROKIl5FfkMbJ3oRFJjo
         JVsAUYIXX4QoCO0wE4A7Mm3y+YwIQFxl8TxYkINaQT+4VLJdrTtweus2/XMU7NjNjMVQ
         ya2aEDcZJ+LpkPEF6nGnurEEq144h1aCfIu7vzwW+cg2v5WVI1iOS6a9x0zBC5xbAH0r
         bs1Q/UxcmC5UZh2PUf6YAluZtHF8CirmDjMN+GNuAaRjIRyzVhtz8LcX/NDwnqExRwoj
         5Zmr8UROoj95TXBI4dxeYZL/oFUY3OT6CYQyzP4qgLgWp+pGKezpUaJn/VLpv/0/a/Zt
         jIgA==
X-Gm-Message-State: APuU4Z+njEhQq9ZwKyz6jWVP2v88/RFD89Lh7mwufJTduQvREP2927XB
	LPOpqk3uBaDW0ggbBU90XM2wMBGfbgh1rlzOAACVSm/RtbyeRsj2l54aeKwskJfERpM2nxVPwKb
	IujnYkTzsvVl/Q4Jbi0p8ICURJALJbxpt/camFeQKMfUIRxTlhYZUM1vABLMdU7Y=
X-Gm-Gg: AYBFou162TAkmOqxSeYd31gsPLcFhe1d952F1VnwlDFYGYv5aqdGTDF+YZbO6dlab/h
	zwTfEFMB3SMYs21gHG4m8GllVYfEEqS8FePokxUyqqtwtaeAvLJqZW1SdkvJIf+B3Q2WxkAsBsk
	wJIXCk9V9wlAOcSfmhc1g7eFYYt9O8H0KBV92Grs37iLymQz7uowoVGZDSpl0nlTFwkPYz68tsR
	ab1hDSYZb3xhxvTltQAusIpBgKX0+ex6V88+ib4S/OY2EwHs8OWkjoFwVQekK/lwpYt3O8EQbE7
	OfLhS6YLoajXDovNYs12q6EJGdYEAWIgx7TwAo3cikEQgt8/hMNlhE0A/T0JNfMrQgLrDO3Dmxm
	7a8iakoLrBHGSNXyxa7fSDHmsCHKzYRZ625pTbuXAxpYyfweRA62xmECnimbklRd3zHdoyl/VV1
	+aYA==
X-Received: by 2002:a05:7022:1308:b0:143:2968:564c with SMTP id a92af1059eb24-1b5030b613cmr11789292c88.26.1794923304650;
        Tue, 17 Nov 2026 05:48:24 -0800 (PST)
X-Received: by 2002:a05:7022:1308:b0:143:2968:564c with SMTP id a92af1059eb24-1b5030b613cmr11789259c88.26.1794923303986;
        Tue, 17 Nov 2026 05:48:23 -0800 (PST)
Received: from hu-akakum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b50319d40asm42336788c88.11.2026.11.17.05.48.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 05:48:23 -0800 (PST)
From: Akash Kumar <akash.kumar@oss.qualcomm.com>
Subject: [PATCH 0/2] usb: typec: ucsi_ccg: Add CC orientation-gpios support
Date: Tue, 17 Nov 2026 19:18:04 +0530
Message-Id: <20261117-ucsi-ccg-cc-orientation-v1-0-a0fb052c7fcd@qti.qualcomm.com>
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABRb/GoC/x3MMQqAMAyF4atIZgOmYgWvIg6SxpqlSqsiiHc3O
 LzhH773QJGsUmCoHshyadEtWVBdAa9zioIarME1zhNRjycXReZow81oOubDDHJoxTmS4NsOTO9
 ZFr3/53F63w+ABvoYaQAAAA==
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Wayne Chang <waynec@nvidia.com>,
        Akash Kumar <akash.kumar@oss.qualcomm.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Akash Kumar <akakum@qti.qualcomm.com>
X-Mailer: b4 0.13.0
X-Proofpoint-GUID: XPhwNuEj1VmqQR3Fq_ZMDFPiHoSXTKeo
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDA1NCBTYWx0ZWRfX6lZ8ZenPiAlK
 Me1DUbxo57jvCLzbtYZKp8r2Fn44ydMsc2fcX05tsrvzyodfoiIhd4JcHXz6/oYyKOPlO/P0seX
 MXFODKdQSr1GL9YG16ADQNnPrRy2Rxw=
X-Proofpoint-ORIG-GUID: XPhwNuEj1VmqQR3Fq_ZMDFPiHoSXTKeo
X-Authority-Analysis: v=2.4 cv=Cuwq4X4D c=1 sm=1 tr=0 ts=6afc5b29 cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=OciRnzNh6Tf4It2_ZlUA:9 a=QEXdDO2ut3YA:10
 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDA1NCBTYWx0ZWRfX0lMrc7K6Rw/S
 2adN9csi+pNYn0y+BcK4kQuHzyrFKACMhSKxCf/ZF8nYyBJ/YusaG287jOfKoiwm10Z7tUAJCtd
 pgu+kqULq8EZEAuEoabLzAo+ORIKi7WGsl+ElqQNX0OLNcnRCYRfcki+TSDOwjKKmWLt2wRuc5s
 f5Cy9/skHah/+mf0gBiNcKQETrYI54mCOA9jx8THNRgiZIqHr+p6X8cN7K69uKwVvMz1W0NtI71
 qh+o20G4ra0+bCcA7rjrlTiuqVlZ379SKcVfVNIs/zk2vdnuMYc/o3C9XHOgeh68dZH23nD3Npz
 B70iNj6fitgjfVKh/XD2ZjIY8hGAlYUH26wfRXSAY0xyk1HznHnINDp8fpVoM953eV3kMKqqYJ9
 aYeRnMq7ULftEKYX6+cCeNrZj6iG3P8Qs8NjYmx1ah88XzKHzWBdUgApX881N4N+hD5Q51RV+GK
 bQBcUIlO/9Y7pII4CdQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_02,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 adultscore=0 clxscore=1015 priorityscore=1501
 spamscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611170054

The CCGx Type-C PD controller has no HPI register exposing CC
polarity, so UCSI status alone cannot tell the typec class which way
a connector is plugged in. This series adds an optional
orientation-gpios property so boards that wire a board-level
CC-orientation sense line to the connector can still report
orientation through typec_set_orientation().

Patch 1 documents the new orientation-gpios property on
cypress,cypd4226.yaml, ordered by connector number (an entry may be
left as <0> for connectors with no sense line).

Patch 2 wires it up in ucsi_ccg: acquire an optional GPIO per
connector in probe(), indexed by the connector's reg property, and
use it from new update_connector/connector_status UCSI ops to set
typec_cap.orientation_aware and drive typec_set_orientation().

Signed-off-by: Akash Kumar <akakum@qti.qualcomm.com>
---
Akash Kumar (2):
      dt-bindings: usb: cypress,cypd4226: Add orientation-gpios property
      usb: typec: ucsi_ccg: Add CC orientation sensing via GPIO

 .../devicetree/bindings/usb/cypress,cypd4226.yaml  | 10 +++
 drivers/usb/typec/ucsi/ucsi_ccg.c                  | 76 +++++++++++++++++++++-
 2 files changed, 85 insertions(+), 1 deletion(-)
---
base-commit: 2c46a57079874df3a60770278f08404f5d0f782d
change-id: 20261117-ucsi-ccg-cc-orientation-cd3e221ed635

Best regards,
-- 
Akash Kumar <akakum@qti.qualcomm.com>

