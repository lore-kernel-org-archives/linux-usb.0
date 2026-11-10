Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794302525;
	b=qF4klU2YGIl3FMnfCEOcKtM9TqfwMYGp2yezmzMQesA0Ku0k4W7pxp2Jz1HxbyRh3uUb
	 wZgweYHRoVME3KOPEWOg8vhoPzTG6X/QkuDF05X/9NZKSPBcCAyQkxP2zClsSWPmuKzug
	 2wuCEbLFDyqe5ovJteuRO7pnArc772m9gOaAkGDAXr/8VcmcHkiE+21o90yVVVUyMePF5
	 jtYW3gUk09HFYmM94cDk2vxLUHfHHe6wdGU+ydaRfgbZXXRzHtxM3hRyybX0dEmP4AT+w
	 PD/6eKnTXq43QlDeXPan/AGUdbBH6awZJkTTz6G7ea4Z99vuajA+sn7oT1UxdGBhXyw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794302525;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=SpZwVIpz/3vpY8Qhp5C1MtGr1AmaddxmUChV+Og8680=;
	b=vWlKAdlqe+txuQ55YwONnUFdk8KjaFqLmZEfC4om1LG+du8NDcOb0uo5/FgaTnuU0Djf
	 xWKVkbJZyjEAe9J3p+t1iVZ01ZzVFJsQ8aEDmsu4LFgS0FTdOsGQjaL4Si7DC4zJbzC82
	 Efgby93YyHy4k6Hn1jM3itpmOWtjDJksR0vboxbO5xkehTgWF1BY/KZU5HNDqOiNbv85V
	 hmPVwt+1iKVPxiOZmdN+lCx7hWFxBE1iDBP9ObsSr2cMFac5eZd3nplWg28ChiwMOIZuw
	 0Qde5TtrRB7Nf/2YXgABJo5mhaHMmwzYEmM3RYwmh6o7UNWO5pa3vN5sykqiLQ27TSQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=e121AiPk;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kOfFfZMo;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8E81606E58E
	for <linux-usb@vger.kernel.org>; Tue, 10 Nov 2026 09:22:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A8E81606E58E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=e121AiPk;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kOfFfZMo
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AA7lDb52240799
	for <linux-usb@vger.kernel.org>; Tue, 10 Nov 2026 09:22:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=SpZwVIpz/3vpY8Qhp5C1MtGr1AmaddxmUCh
	V+Og8680=; b=e121AiPk35J30TLioc7J7i0gE+kMarl+GfW7fO34cc9MUxOvx0H
	EXw967PMUZWBci80nGFD6EDdpcdbUT9hmjnZiTm6UBgsV43KrQLE0KUvr8syA0Ji
	lKaGzHB1saRo9p0O5Uaq7WOghMaLkNsY8Hk87/EvyQPNgZxDwmt/e/x8sbru4cqv
	BCBpqJ4LNUyUoVbEj68gxqS3gNrhTv/sKWFh83N3SJLbltLwJy0t7C6KLIHLqrp4
	L/9UXpUu+L1vRP7Taaxa49v4J+Z/OwLBta9fS0NPcH2DmwK3xM+DtxKb1h4JXSfG
	LVmfOeXTwrxd776VQDJq7ABVEdS8OZtTe1g==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4huucp1a24-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Tue, 10 Nov 2026 09:22:03 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-33c35f5ca6cso3849760eec.1
        for <linux-usb@vger.kernel.org>; Tue, 10 Nov 2026 01:22:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794302523; x=1794907323; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=SpZwVIpz/3vpY8Qhp5C1MtGr1AmaddxmUChV+Og8680=;
        b=kOfFfZMoCDemRvL2FC3l4BxPWSjlZjCCtdhxe6VRdq+lcSeP+LuykJIXyjhhaAK0pD
         gCoDsTtMLdqZmw3AX/d7GagEinMwYJug9w6YEZx72bRv7/H55mPFVwonJ0Z/7DlCwocH
         +RbU6QppvdZqu11M16U5GCiwmBSZkn/jbdso/Yq0Rq/o2ajn/ZUpAX/LuKas4T7f90mX
         HUTDyCX1p5ZTvE0fuarYP+h+rzh41aknue09A4i5KoL9jV61MqX4d6D5yGncej22dc8N
         Ol3T74T3oHs6E8UBRVrqbr1BE6BBDyfQKHz3a8GjEvrDM6oj5xpl8gn9QeTGB7X9mzxK
         JIqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794302523; x=1794907323;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SpZwVIpz/3vpY8Qhp5C1MtGr1AmaddxmUChV+Og8680=;
        b=pGXXOR0dyebrg1tQ8jb68YTZRMBmDvEgqOQ09p66PV6EhucyR3tfUJl6ENLe3+u2C1
         AVR3Quko6bc3EqB3VqGki4moYHOazkKzNltWQaO3JkG9lTMTb3AFxxpZ3eCpGIWYgIfq
         rSfsP4B9hrWTPGxZeMkEKF6eHwoaFwstwfwdPFyXo7fg4IrER2L6lKs7szryGtyv7d/T
         smdnhlE2n9Byyslj97f4hhf+riDml580SfQ5hBxHu4F119kohe0eu6PCjkiH/5DUhi3M
         k5wowL0Ww7PCoBd1goRKPFg/gByMSxTeWPprfZLYcHpxJTqJxegODzvMnSE1j2eIcFcz
         DqpA==
X-Forwarded-Encrypted: i=1; AL+hErHmBjOyGxvrmHBQ/CyLSKXi/0YzmUIilKFn9KQW0lMYEvMcULei2ceJyBqtaZPZGtoLNnsU5hj/zX0=@vger.kernel.org
X-Gm-Message-State: APuU4Z90VWM6vvMLV5RFgGtQEgECxq2po8RvjW1qwpnMKO4CWMb+7KmS
	5tuHwzroXJqSbo5C6oR97g4KXYEMhnmgVpMLE+vVODgpIOicjfQGTEOFiIBtGoQVHlXVs++jea4
	i/Pc43oRuk/3tpKDR+DslVCT9vTHX96NBBFPD6YyHhxD83xkHqnriZNa/Q1D4qJI=
X-Gm-Gg: AYBFou1GqqW7w2LRXyBOjHexOal89QbHgUSCt3QEw3nvx2OmNgE4n9dTQGaTEoadu6h
	GLE9NfXw+/rfQ4viF+LT5vvXRjPzTt6408fA37y1e3G/Rjq98bnf2DrJtkpgUzJIDR5Jqc1r0TI
	qWBANUDs/EOQGpK1cp7Q6LikjlPUDFQ8Mlm35i0d3Vt4btCkYhMB0RsBVutyNv/cXCWejpe3ck4
	V1KcyKjGP3MKimqRISmnSVXwS+SlXAt2o2XmgSunmuXZHQqRkDgJ5wvDxqAthfUQLx6y4K7gXOl
	xBn5MJEei605shIAoPsrVwrpp2aWVlH0KPau83TntZFpwbt6+CVdpDzP8WLBIV50PtstouczITI
	h4x4Im60DMpsHQalotxpNbMmoIbVhYgf0g4xlxd4YK44dTTCxLU9zd2XwjAJ3ccp4FhVMweAJkx
	Wgdkydq2O/Sow8gf2gE+7rrg==
X-Received: by 2002:a05:7300:54b:b0:36f:350b:3838 with SMTP id 5a478bee46e88-3751fa3d477mr4201339eec.31.1794302523260;
        Tue, 10 Nov 2026 01:22:03 -0800 (PST)
X-Received: by 2002:a05:7300:54b:b0:36f:350b:3838 with SMTP id 5a478bee46e88-3751fa3d477mr4201290eec.31.1794302522745;
        Tue, 10 Nov 2026 01:22:02 -0800 (PST)
Received: from hu-petche-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-375218c863csm5257153eec.28.2026.11.10.01.22.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 01:22:02 -0800 (PST)
From: Peter Chen <peter.chen@oss.qualcomm.com>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Johan Hovold <johan@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
        Udipto Goswami <udipto.goswami@oss.qualcomm.com>,
        Jack Pham <jack.pham@oss.qualcomm.com>,
        Pratham Pratap <pratham.pratap@oss.qualcomm.com>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Prashanth K <prashanth.k@oss.qualcomm.com>,
        Elson Serrao <elson.serrao@oss.qualcomm.com>,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Chen <peter.chen@oss.qualcomm.com>
Subject: [PATCH 0/1] usb: dwc3: qcom: Keep wakeup option default off
Date: Tue, 10 Nov 2026 01:21:56 -0800
Message-ID: <20261110092157.2989350-1-peter.chen@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: v5GfWmwE0_0Op6iy8udAL3SHkFpb3IyY
X-Authority-Analysis: v=2.4 cv=U4oHnuru c=1 sm=1 tr=0 ts=6af2e23c cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=_NthRW4p-O9EqLlfnj0A:9
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDAzNyBTYWx0ZWRfX6YltavIEcOwJ
 JbSUVMdSGby6Haki8UKmT/KoELZMlCm53jtO0RUWoQYn+VU1uZvve8+3NfhssdG9PojtE6685no
 UWBaP8bMiNFdAFTBvs8jANtGti507mHdP3VzysItRRfs8a1Nbqqh2kh7QiHEVSZ866LLhvwWf3o
 ZdtzwH4MaRSSAqMnR/8vpW07b0+h4a5BzYYtPSxcbdMlGDsSYSPPjKLQKAb38QjeNtsC0vmC7Fd
 nffj3icAuu8ADjbsWfMPs/VLSDxD0ks4RGBNCiwMvOAMeM3VTlYdBMEOwPKJQjeVe+UkQoz0QkN
 cn1MqlFXTMnTDbu7Eo9buegKHykuPmMu9HYUKzlZCZmPEy2IqaPP+vUFgq4cTJtqex2f7MIr//e
 Kso9I0pF7ghC8EhKje4Lw/kpDAyrPxcIltoZgf3f5TKK/AUtQe51klqFFQLbpAoYFde+ApdtdM/
 tzzRbtT4BKGXNCn0PKg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDAzNyBTYWx0ZWRfXxxthdw7hnBkW
 6tlmoW4BMpKfLJplvG7eJFM4x5Re0JYFpcNyqWCZ/W2ym670zWBo6k138noIbEf4iCbcXuTzO2R
 Npf5CoBwMzgh9C779eJQ+ANoLlYOoO8=
X-Proofpoint-GUID: v5GfWmwE0_0Op6iy8udAL3SHkFpb3IyY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_03,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 impostorscore=0 clxscore=1015 priorityscore=1501
 malwarescore=0 spamscore=0 adultscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611100037

Current policy
--------------
When the controller node has the "wakeup-source" property, dwc3-qcom
calls device_init_wakeup(dev, true). USB is then a system wakeup
source by default. Users who do NOT want the system woken up by USB
have to disable it:

  echo disabled > /sys/devices/.../<dwc3 device>/power/wakeup

Proposed policy
---------------
"wakeup-source" only describes that the controller is capable of
waking up the system (see
Documentation/devicetree/bindings/power/wakeup-source.txt), so with
this patch the driver only marks the device as wakeup capable, and
power/wakeup starts out "disabled". Users who NEED USB as a wakeup
source have to enable it:

  echo enabled > /sys/devices/.../<dwc3 device>/power/wakeup

The motivation is:

- Users do not expect USB activity (connect/disconnect or USB line status
  changes) to wake up the system unless they asked for it.

- Power consumption. With wakeup enabled, host mode system suspend
  keeps PHYs powered (dwc3_core_exit() is skipped) and necessary logic
  for detecting wakeup must be on, so that the wakeup interrupts can
  fire. Today this extra power is spent by default, even on systems
  where USB is never used as a wakeup source and the controller could
  be fully powered off during suspend.

Comparison
----------
                       Current (default on)       Proposed (default off)
                       --------------------       ----------------------
Initial power/wakeup   enabled                    disabled
User action            write "disabled" if USB    write "enabled" if USB
                       wakeup is NOT wanted       wakeup IS wanted
Unexpected wakeups     possible (connect,         none unless the user
                       disconnect, noise)         opted in
Suspend power          higher, even if USB        lower, USB fully powered
                       wakeup is never used       off
Attached devices on    stay suspended, resume     reset-resumed or
resume                 quickly                    re-enumerated

Possible regression
-------------------
This is a user-visible change for existing platforms. Many Qualcomm
arm64 DTs set "wakeup-source" on the USB controller. With this patch:

- USB wakeup stops working until userspace (or a udev rule) writes
  "enabled" to the controller's power/wakeup.

- In host mode, because device_may_wakeup() is now false by default,
  system suspend takes the full power down path in
  dwc3_suspend_common() (dwc3_core_exit()). Platforms where this
  power down path has not been tested may fail to resume.

Peter Chen (1):
  usb: dwc3: qcom: Keep wakeup option default off

 drivers/usb/dwc3/dwc3-qcom.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

-- 
2.43.0

